class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :bookname
      t.text :description
      t.integer :page
      t.integer :price

      t.timestamps
    end
  end
end
