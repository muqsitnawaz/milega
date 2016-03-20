class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.belongs_to :user, index:true
      t.varchar :cname
      t.varchar :ctype

      t.timestamps
    end

    create_table :products do |t|
      t.belongs_to :company, index:true
      t.varchar :pname
      t.varchar :pdescrip
      t.integer :pprice
      t.varchar :pcategory
      t.varchar :psubcategory
      t.boolean :active
      t.varchar :image1
      t.varchar :image2
      t.varchar :image3

      t.timestamps
    end
  end
end
