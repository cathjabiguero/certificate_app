class AnotherUpdate < ActiveRecord::Migration[5.1]
  def change
    add_column:owners, :subtitle, :string, after: :title
  end
end
