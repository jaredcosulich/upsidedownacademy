class TextCaption < ActiveRecord::Migration
  def up

    change_column :videos, :caption, :text

  end

  def down
  end
end
