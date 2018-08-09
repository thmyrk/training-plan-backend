class WorkoutExercisePresenter < BasePresenter
  def initialize(workout_exercise)
    @workout_exercise = workout_exercise
  end

  def basic
    workout_exercise = {}
    workout_exercise[:id] = @workout_exercise.id
    workout_exercise[:sets] = @workout_exercise.sets
    workout_exercise[:reps] = @workout_exercise.reps
    workout_exercise[:workout_id] = @workout_exercise.workout_id
    workout_exercise[:exercise] = ExercisePresenter.new(@workout_exercise.exercise).build(:basic, :with_tags)
    workout_exercise[:created_at] = @workout_exercise.created_at
    workout_exercise[:updated_at] = @workout_exercise.updated_at
    workout_exercise
  end
end
