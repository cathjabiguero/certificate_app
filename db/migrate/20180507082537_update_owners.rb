class UpdateOwners < ActiveRecord::Migration[5.1]
  def change
    remove_column :owners,  :first
    remove_column :owners,  :paragraph
    remove_column :owners,  :second
    remove_column :owners,  :paragraph
    remove_column :owners,  :first
    remove_column :owners,  :person
    remove_column :owners,  :name
    remove_column :owners,  :first
    remove_column :owners,  :position
  end
end
