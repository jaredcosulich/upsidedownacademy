class AddPublishedFlag < ActiveRecord::Migration
  def up

    change_table :lessons do |t|
      t.date :published_at
    end

  end

  def down

    change_table :lessons do |t|
      t.date :published_at
    end

  end
end
