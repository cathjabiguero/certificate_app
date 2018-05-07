class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :header
      t.string :title
      t.string :recepient
      t.string :name
      t.string :first
      t.string :paragraph
      t.string :second
      t.string :paragraph
      t.string :first
      t.string :person
      t.string :name
      t.string :first
      t.string :position

      t.timestamps
    end
  end
end
