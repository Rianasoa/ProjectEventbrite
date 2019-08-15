class ChargesController < ApplicationController
	before_action :admin_user, only: [:index, :edit]

	def index
    @attendances = []
    attendances_ids = Attendance.where(event_id: params[:event_id]).ids
    attendances_ids.each do |id|
    	@attendances << Attendance.find(id)
    end
	end	

	def new
  	@event = Event.find(params[:event_id])
  	@amount = @event.price
	end

	def create
		@event = Event.find(params[:event_id])
  	@amount = @event.price

  	customer = Stripe::Customer.create(
    	:email => params[:stripeEmail],
    	:source  => params[:stripeToken]
		)
		
  	charge = Stripe::Charge.create(
    	:customer    => customer.id,
    	:amount      => @amount,
    	:description => 'Rails Stripe customer',
    	:currency    => 'eur'
		)

		a = Attendance.new(stripe_customer_id: customer.id, event_id: @event.id, user_id: current_user.id)

		if a.save
			redirect_to event_path(@event.id)
		else
			render new_event_charge_path(@event.id)
		end

	rescue Stripe::CardError => e
  	flash[:error] = e.message
  	redirect_to new_charge_path
	
	end

	private
	
	def admin_user
    @event = Event.find(params[:event_id])
    unless @event.admin_id == current_user.id
      flash[:danger] = "It is not your event"
      redirect_to event_index_path
      return true
    end
  end

end
