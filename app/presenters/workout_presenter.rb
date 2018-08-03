class WorkoutPresenter < BasePresenter
  def initialize(workout)
    @workout = workout
  end

  def basic
    workout = {}
    workout[:id] = @workout.id
    workout[:name] = @workout.name
    workout[:created_at] = @workout.created_at
    workout[:updated_at] = @workout.updated_at
    workout
  end

  def with_full_exercises
    workout = {}
    workout[:exercises] = ExercisesPresenter.new(@workout.exercises).build_many(:basic, :with_tags)
    workout
  end
end
