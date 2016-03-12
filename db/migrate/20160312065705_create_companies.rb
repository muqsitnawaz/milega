class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :cname
      t.string :ctype

      t.timestamps null: false
    end
  end
end
