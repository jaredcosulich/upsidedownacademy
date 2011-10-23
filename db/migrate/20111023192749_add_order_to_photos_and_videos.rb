class AddOrderToPhotosAndVideos < ActiveRecord::Migration
  def change

    change_table :photos do |t|
      t.integer :position
    end

    change_table :videos do |t|
      t.integer :position
    end

  end
end
