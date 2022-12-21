class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.date :birthday
      t.timestamps
    end
  end
end
