module UseCases
  module Workouts
    class Show
      def initialize(params)
        @params = params
      end

      def call
        Workout.find(@params[:id])
      end
    end
  end
end
