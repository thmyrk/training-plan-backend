# == Schema Information
#
# Table name: workouts
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_exercises
  has_many :exercises, through: :workout_exercises

  validates :name, presence: true
end
