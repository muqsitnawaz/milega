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
      
      t.boolean :psize_xs
      t.boolean :psize_s
      t.boolean :psize_m
      t.boolean :psize_l
      t.boolean :psize_xl

      t.integer :pprice
      t.integer :pstock
      t.string :pcategory
      t.string :psubcategory
      t.string :pdetailcategory

      t.string :p_c1_code
      t.string :p_c1_image1
      t.string :p_c1_image2
      t.string :p_c1_image3

      t.string :p_c2_code
      t.string :p_c2_image1
      t.string :p_c2_image2
      t.string :p_c2_image3

      t.string :p_c3_code
      t.string :p_c3_image1
      t.string :p_c3_image2
      t.string :p_c3_image3

      t.string :p_c4_code
      t.string :p_c4_image1
      t.string :p_c4_image2
      t.string :p_c4_image3

      t.string :p_c5_code
      t.string :p_c5_image1
      t.string :p_c5_image2
      t.string :p_c5_image3

      t.string :p_c6_code
      t.string :p_c6_image1
      t.string :p_c6_image2
      t.string :p_c6_image3

      t.timestamps
    end
  end
end
