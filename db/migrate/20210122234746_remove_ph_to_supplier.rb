class RemovePhToSupplier < ActiveRecord::Migration[6.0]
  def change
    change_column :suppliers, :phone_number, :string
    add_column :products, :supplier_id, :integer
  end
end
