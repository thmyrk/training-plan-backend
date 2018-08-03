class ExercisesCreateSchema
  Schema = Dry::Validation.Params(BaseSchema) do
    required(:name).filled(:str?).value(min_size?: 2)
  end
end
