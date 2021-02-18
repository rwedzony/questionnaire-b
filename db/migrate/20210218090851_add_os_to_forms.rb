class AddOsToForms < ActiveRecord::Migration[6.0]
  def change
    add_column :forms, :os, :integer
  end
end
