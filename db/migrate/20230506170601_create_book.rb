class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :count
      
      t.timestamps
    end
  end
end
