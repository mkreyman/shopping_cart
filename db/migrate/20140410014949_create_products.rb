class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      # Use a scale of 2 if you want two digits to the right of the decimal point
      # Precision 10 means a price of upto 99,999,999.99
      t.decimal :price, :precision => 10, :scale => 2
      t.string :image_url

      t.timestamps
    end
  end
end
