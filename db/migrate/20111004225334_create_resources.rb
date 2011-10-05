class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :lesson_id
      t.string :title
      t.string :url
      t.text :comment

      t.timestamps
    end
  end
end
