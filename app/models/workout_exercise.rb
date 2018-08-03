# == Schema Information
#
# Table name: workouts_exercises
#
#  id          :uuid             not null, primary key
#  workout_id  :uuid             not null
#  exercise_id :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class WorkoutExercise < ApplicationRecord
  self.table_name = "workouts_exercises"

  belongs_to :workout
  belongs_to :exercise
end
