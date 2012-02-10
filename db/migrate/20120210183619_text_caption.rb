class TextCaption < ActiveRecord::Migration
  def up

    change_column :video, :caption, :text

  end

  def down
  end
end
