class CreateLessonLinks < ActiveRecord::Migration
  def change
    create_table :lesson_links do |t|
      t.integer :lesson_id
      t.integer :linked_lesson_id
      t.boolean :next_lesson, :default => true

      t.timestamps
    end
  end
end
