class ExercisePresenter < BasePresenter
  def initialize(exercise)
    @exercise = exercise
  end

  def basic
    exercise = {}
    exercise[:id] = @exercise.id
    exercise[:name] = @exercise.name
    exercise[:created_at] = @exercise.created_at
    exercise[:updated_at] = @exercise.updated_at
    exercise
  end

  def with_tags
    exercise = {}
    exercise[:tags] = TagsPresenter.new(@exercise.tags).build_many(:basic)
    exercise
  end
end
