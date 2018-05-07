class UpdateOwnersAgain < ActiveRecord::Migration[5.1]
  def change
    rename_column :owners, :recepient, :recipient_name
    add_column :owners, :first_paragraph, :text
    add_column :owners, :second_paragraph, :text
    add_column :owners, :first_assignatory_name, :string
    add_column :owners, :first_assignatory_position, :string
    add_column :owners, :second_assignatory_name, :string
    add_column :owners, :second_assignatory_position, :string
  end
end
