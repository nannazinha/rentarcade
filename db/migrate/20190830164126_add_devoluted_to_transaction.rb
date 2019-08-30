class AddDevolutedToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :devoluted, :boolean, default: false
  end
end
