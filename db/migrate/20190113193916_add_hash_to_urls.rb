class AddHashToUrls < ActiveRecord::Migration[5.2]
  def change
    add_column :urls, :hashed_num, :int
  end
end
