class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.string :first_name
      t.string :birth_date
      t.string :something_about

      t.timestamps
    end
  end
end
