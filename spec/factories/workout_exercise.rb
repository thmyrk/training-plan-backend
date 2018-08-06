FactoryBot.define do
  factory :workout_exercise do
    sequence(:sets) { |i| i }
    sequence(:reps) { |i| i }
    workout
    exercise
  end
end
