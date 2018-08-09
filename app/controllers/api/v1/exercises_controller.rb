module Api
  module V1
    class ExercisesController < ApiController
      def index
        validate_params!(ExercisesIndexSchema::Schema)
        exercises = UseCases::Exercises::Index.new.call
        render_ok(ExercisesPresenter.new(exercises).build_many(:basic, :with_tags))
      end

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
