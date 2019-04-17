class AddPhotoToPics < ActiveRecord::Migration[5.2]
  def change
    add_column :pics, :photo, :string
  end
end
