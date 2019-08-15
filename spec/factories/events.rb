FactoryBot.define do
  factory :event do
    start_date { "2019-02-11 16:09:11" }
    duration { 1 }
    title { "MyString" }
    price { 1 }
    location { "MyString" }
  end
end
