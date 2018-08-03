# == Schema Information
#
# Table name: exercises
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exercise < ApplicationRecord
  has_many :exercise_tags
  has_many :tags, through: :exercise_tags

  validates :name, presence: true
end
