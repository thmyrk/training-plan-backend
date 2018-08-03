# == Schema Information
#
# Table name: exercises_tags
#
#  id          :uuid             not null, primary key
#  tag_id      :uuid             not null
#  exercise_id :uuid             not null
#

class ExerciseTag < ApplicationRecord
  self.table_name = "exercises_tags"

  belongs_to :exercise
  belongs_to :tag
end
