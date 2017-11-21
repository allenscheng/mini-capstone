class AddClotheType < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :clothe_type, :string
  end
end
