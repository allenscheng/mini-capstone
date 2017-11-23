class ChangeClotheTypeToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :clothe_type, :name 
  end
end
