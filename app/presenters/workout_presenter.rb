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

  def with_workout_exercises
    workout = {}
    workout[:workout_exercises] = WorkoutExercisesPresenter.new(@workout.workout_exercises).build_many(:basic)
    workout
  end
end
