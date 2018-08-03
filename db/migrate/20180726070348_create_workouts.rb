class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts, id: :uuid do |t|
      t.string :name, null: false
      t.uuid :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
