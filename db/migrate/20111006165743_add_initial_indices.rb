class AddInitialIndices < ActiveRecord::Migration
  def up

    change_table :lessons, do |t|
      t.string :specific_subject
    end

    add_index :lessons, :user_id
    add_index :videos, :lesson_id
    add_index :references, :lesson_id
  end

  def down

    change_table :lessons, do |t|
      t.remove :specific_subject
    end

    remove_index :lessons, :user_id
    remove_index :videos, :lesson_id
    remove_index :references, :lesson_id
  end
end
