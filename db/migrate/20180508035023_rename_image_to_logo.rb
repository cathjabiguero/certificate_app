class RenameImageToLogo < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :logo_uid, :string
    add_column :owners, :logo_name, :string
    remove_column :owners, :image_uid
    remove_column :owners, :image_name
  end
end
