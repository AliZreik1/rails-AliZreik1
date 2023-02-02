class AddPictureToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :picture, :string
  end
end
