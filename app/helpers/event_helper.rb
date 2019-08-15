module EventHelper

  def  new_event
    Event.new
  end

  def current_event
    Event.find(@event.id)
  end

  def event_end_date
    event_end_at = @event.start_date + @event.duration.minutes
  end

  def admin_event_email
    User.find(current_event.admin_id).email
  end

end
