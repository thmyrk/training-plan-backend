module Api
  module V1
    class WorkoutsController < ApiController
      def show
        validate_params!(WorkoutsShowSchema::Schema)
        workout = UseCases::Workouts::Show.new(workouts_show_params).call
        render_ok(WorkoutPresenter.new(workout).build(:basic, :with_workout_exercises))
      end

      private

      def workouts_show_params
        params.permit(:id)
      end
    end
  end
end
