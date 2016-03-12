# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

companies = [
    {cname: "Levis", ctype: "Clothing"},
    {cname: "Apple", ctype: "Electronics"},
    {cname: "Hermes", ctype: "Clothing"},
    {cname: "Levis Strauss", ctype: "Clothing"}
];

products = Hash[
    "levis" => [
        {:pname => "Cotton Jeans", :pdescrip => "Cotton Jeans Pants", :pprice => "20"},
        {:pname => "Denim Jeans", :pdescrip => "Denim Jeans Pants", :pprice => "80"}
    ],

    "apple" => [
        {:pname => "iPod 3", :pdescrip => "iPod 3 Brand New", :pprice => "350"},
        {:pname => "iPhone 6", :pdescrip => "iPhone 6 Gold", :pprice => "700"},
        {:pname => "iPhone 6s", :pdescrip => "iPhone 6s Rose Gold", :pprice => "900"}
    ],

    "hermes" => [
        {:pname => "Denim Jeans", :pdescrip => "Denim Jeans Pants", :pprice => "200"},
        {:pname => "Causal Shirt", :pdescrip => "Causal Cotton Shirt", :pprice => "80"},
        {:pname => "Bow Tie", :pdescrip => "Dark Black formal bow tie", :pprice => "25"},
    ],

    "levis strauss" => [
        {:pname => "Denim Jeans", :pdescrip => "Denim Jeans Pants", :pprice => "70"},
        {:pname => "T- Shirt", :pdescrip => "Grey t-shirt for Summer", :pprice => "15"}
    ]
]

companies.each do |c|
    comp = Company.create! c

    (products[comp.cname.downcase]).each do |p|
        comp.products.create p
    end
end