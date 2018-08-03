FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "john#{i}@example.com" }
    sequence(:password) { |i| "password#{i}" }
  end
end
