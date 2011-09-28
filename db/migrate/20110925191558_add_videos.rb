class AddVideos < ActiveRecord::Migration
  def up

    create_table :videos do |t|
      t.integer :lesson_id
      t.string :title
      t.string :caption
      t.string :youtube_id
    end

  end

  def down
    drop_table :videos
  end
end
