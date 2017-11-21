class ChangeSleeveLengthName < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :sleeve_length, :length
  end
end
