module Api
  module V1
    class ExercisesController < ApiController
      def create
        validate_params!(ExercisesCreateSchema::Schema)
        UseCases::Exercises::Create.new(exercises_create_params).call
        render_created
      end

      private

      def exercises_create_params
        params.permit(:name, :diet_id)
      end
    end
  end
end
