class AddQrToOwners < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :qr_code_uid,  :string
    add_column :owners, :qr_code_name, :string 
  end
end
