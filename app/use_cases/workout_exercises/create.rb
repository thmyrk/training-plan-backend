module UseCases
  module WorkoutExercises
    class Create
      def initialize(params)
        @params = params
      end

      def call
        WorkoutExercise.create!(workout_id: @params[:workout_id], exercise_id: @params[:exercise_id], reps: @params[:reps], sets: @params[:sets])
      end
    end
  end
end
