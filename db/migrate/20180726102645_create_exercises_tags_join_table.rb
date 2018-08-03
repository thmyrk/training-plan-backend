class CreateExercisesTagsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises_tags, id: :uuid do |t|
      t.uuid :tag_id, null: false, index: true, foreign_key: true
      t.uuid :exercise_id, null: false, index: true, foreign_key: true
    end
  end
end
