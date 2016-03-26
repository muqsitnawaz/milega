class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.belongs_to :user, index:true
      t.string :cname
      t.string :ctype
      t.string :caddress
      t.string :cemail
      t.string :cphone_official
      t.string :cphone_personal
      t.string :clogo

      t.timestamps
    end

    create_table :products do |t|
      t.belongs_to :company, index:true
      t.string :pname
      t.string :pdescrip
      t.string :psize
      t.integer :pprice
      t.integer :pstock
      t.string :pcategory
      t.string :psubcategory
      t.string :pdetailcategory
      t.string :pimage1
      t.string :pimage2
      t.string :pimage3

      t.timestamps
    end
  end
end
