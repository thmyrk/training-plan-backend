class AddSetsAndRepsToWorkoutExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts_exercises, :sets, :integer
    add_column :workouts_exercises, :reps, :integer
  end
end
