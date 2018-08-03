FactoryBot.define do
  factory :tag do
    sequence(:name) { |i| "Tag name #{i}" }
  end
end
