FactoryBot.define do
  factory :exercise do
    sequence(:name) { |i| "Exercise name #{i}" }
  end
end
