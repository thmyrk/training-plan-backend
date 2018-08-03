FactoryBot.define do
  factory :workout do
    user
    sequence(:name) { |i| "Workout name #{i}" }

    trait :with_exercises do
      after(:create) do |workout|
        exercises = create_list(:exercise, 3)
        exercises.each { |exercise| create(:workout_exercise, exercise: exercise, workout: workout) }
      end
    end

    trait :with_exercises_with_tags do
      after(:create) do |workout|
        exercises = create_list(:exercise, 3)
        exercises.each { |exercise| create(:workout_exercise, exercise: exercise, workout: workout) }
        tags = create_list(:tag, 3)
        tags.each_with_index { |tag, index| create(:exercise_tag, exercise: exercises[index], tag: tag) }
      end
    end
  end
end
