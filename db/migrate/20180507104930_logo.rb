class Logo < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :image_uid,  :string
    add_column :owners, :image_name, :string 
  end
end
