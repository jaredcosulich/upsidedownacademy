class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.string :subject
      t.string :title
      t.text :body
      t.integer :confidence_score

      t.timestamps
    end
  end
end
