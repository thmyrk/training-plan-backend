class ExercisesPresenter < BasePresenter
  def initialize(exercises)
    @exercises = exercises
  end

  def build_many(*representations, **keyword_representations)
    @exercises.map do |exercise|
      ExercisePresenter.new(exercise).build(*representations, keyword_representations)
    end
  end
end
