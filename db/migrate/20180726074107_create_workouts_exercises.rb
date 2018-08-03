class CreateWorkoutsExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts_exercises, id: :uuid do |t|
      t.uuid :workout_id, foreign_key: true, null: false
      t.uuid :exercise_id, foreign_key: true, null: false

      t.timestamps
    end
  end
end
