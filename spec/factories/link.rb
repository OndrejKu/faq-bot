FactoryGirl.define do
  factory :link do
    url FFaker::Internet.http_url
    description FFaker::Lorem.phrase
    company
  end
end