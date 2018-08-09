FactoryBot.define do
  factory :exercise do
    sequence(:name) { |i| "Exercise name #{i}" }

    trait :with_tags do
      after(:create) do |exercise|
        tags = create_list(:tag, 2)
        create(:exercise_tag, tag: tags[0], exercise: exercise)
        create(:exercise_tag, tag: tags[1], exercise: exercise)
      end
    end
  end
end
