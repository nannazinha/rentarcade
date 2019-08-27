class AddCostToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :cost, :integer
  end
end
