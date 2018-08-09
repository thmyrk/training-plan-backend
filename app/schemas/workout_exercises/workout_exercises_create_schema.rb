class WorkoutExercisesCreateSchema
  Schema = Dry::Validation.Params(BaseSchema) do
    required(:workout_id).filled(:uuid?).value(min_size?: 1)
    required(:exercise_id).filled(:uuid?).value(min_size?: 1)
    optional(:reps).maybe(:int?)
    optional(:sets).maybe(:int?)
  end
end
