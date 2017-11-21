class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sleeve_length
      t.string :color
      t.string :price
      t.string :image

      t.timestamps
    end
  end
end
