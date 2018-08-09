module Api
  module V1
    class WorkoutExercisesController < ApiController
      def create
        validate_params!(WorkoutExercisesCreateSchema::Schema)
        workout_exercise = UseCases::WorkoutExercises::Create.new(workout_exercises_create_params).call
        render_created(WorkoutExercisePresenter.new(workout_exercise).build(:basic))
      end

      def destroy
        validate_params!(WorkoutExercisesDestroySchema::Schema)
        UseCases::WorkoutExercises::Destroy.new(workout_exercises_destroy_params).call
        render_no_content
      end

      private

      def workout_exercises_create_params
        params.permit(:workout_id, :exercise_id, :reps, :sets)
      end

      def workout_exercises_destroy_params
        params.permit(:id)
      end
    end
  end
end
