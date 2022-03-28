class CreateJoinTableExerciseRoutine < ActiveRecord::Migration[7.0]
  def change
    create_join_table :exercises, :routines do |t|
      t.index [:exercise_id, :routine_id]
    end
  end
end
