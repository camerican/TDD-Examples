
FactoryGirl.define do
  factory :dog do
    name "Watson"
    email "bark@dev.com"
    city "New York"
    state "NY"
    password 'barkbark'
    password_confirmation 'barkbark'
    birthday Time.now-3.years
  end
end