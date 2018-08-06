class WorkoutExercisesPresenter < BasePresenter
  def initialize(workout_exercises)
    @workout_exercises = workout_exercises
  end

  def build_many(*representations, **keyword_representations)
    @workout_exercises.map do |exercise|
      WorkoutExercisePresenter.new(exercise).build(*representations, keyword_representations)
    end
  end
end
