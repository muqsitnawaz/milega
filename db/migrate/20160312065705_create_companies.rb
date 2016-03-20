class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.belongs_to :user, index:true
      t.string :cname
      t.string :ctype

      t.timestamps
    end

    create_table :products do |t|
      t.belongs_to :company, index:true
      t.string :pname
      t.string :pdescrip
      t.integer :pprice
      t.string :pcategory
      t.string :psubcategory
      t.boolean :active
      t.string :image1
      t.string :image2
      t.string :image3

      t.timestamps
    end
  end
end
