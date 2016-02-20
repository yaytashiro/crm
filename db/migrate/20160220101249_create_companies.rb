class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null:false
      t.string :ul
      t.string :address

      t.timestamps null: false
    end
  end
end
