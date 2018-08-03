module UseCases
  module Exercises
    class Create
      def initialize(params)
        @params = params
      end

      def call
        Exercise.create!(name: @params[:name])
      end
    end
  end
end
