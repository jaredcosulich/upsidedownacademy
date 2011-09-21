class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :confidence_score

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
