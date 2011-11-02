class FixPublishedAt < ActiveRecord::Migration
  def up

    rename_column :lessons, :published_at, :published_date
    change_table :lessons do |t|
      t.datetime :published_at
    end
    execute("UPDATE lessons SET published_at = published_date")
    execute("ALTER TABLE lessons DROP COLUMN published_date")
    
  end

  def down
  end
end
