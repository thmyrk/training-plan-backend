module UseCases
  module Exercises
    class Index
      def call
        Exercise.all.order(:name)
      end
    end
  end
end
