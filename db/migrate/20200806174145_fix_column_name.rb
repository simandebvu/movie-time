class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :coverimage, :cover_image
    #cover_image more readable than coverimage
  end
end
