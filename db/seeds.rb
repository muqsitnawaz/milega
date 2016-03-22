# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

companies = [
    {cname: "Levis", ctype: "Clothing", user_id: 2},
    {cname: "Apple", ctype: "Electronics", user_id: 3},
    {cname: "Hermes", ctype: "Clothing", user_id: 2},
    {cname: "Levis Strauss", ctype: "Clothing", user_id: 2}
];

products = Hash[
    "levis" => [
        {:pname => "Cotton Jeans", :pdescrip => "Cotton Jeans Pants", :pprice => "20"},
        {:pname => "Denim Jeans", :pdescrip => "Denim Jeans Pants", :pprice => "80"},
        {:pname => "501 Original Jeans", :pdescrip => "501 Original Shrink-To-Fit Jeans", :pprice => "43"},
        {:pname => "501 Original Jeans", :pdescrip => "501 Original Fit Jeans", :pprice => "45"},
        {:pname => "CT Jeans", :pdescrip => "501 CT Jeans", :pprice => "50"},
        {:pname => "501 Original Selvedge Jeans", :pdescrip => "501 Original Selvedge Jeans for Summer", :pprice => "128"},
        {:pname => "501 Original Fit Jeans", :pdescrip => "501 Original Fit Torn Jeans for Summer", :pprice => "95"}
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
        {:pname => "Summer T-Shirt", :pdescrip => "Grey t-shirt for Summer", :pprice => "15"},
        {:pname => "Summer Denim Shorts", :pdescrip => "Denim Shorts for Summer", :pprice => "18"},
        {:pname => "Cotton Jeans Shorts", :pdescrip => "Cotton Jeans Shorts for Summer", :pprice => "12"},
        {:pname => "Denim Shorts", :pdescrip => "Torn Denim Jeans Shorts", :pprice => "20"}
    ]
]


users = [
    {uname: "Muqsit Nawaz", email: "muqsitnawaz@gmail.com", password: "M4sk3dv1p3r", password_confirmation: "M4sk3dv1p3r", user_role: 1, uphone: "+923367708020", uaddress: "Chandan Wala, Jhang Saddar"},
    {uname: "Nofel Yasin", email: "nofelyasin@gmail.com", password: "nofelyasin", password_confirmation: "nofelyasin", user_role: 2, uphone: "+923333347577", uaddress: "Gulshan-e-Iqbal, Karachi"},
    {uname: "Ali Rafiq", email: "alirafiq@yahoo.com", password: "alirafiq", password_confirmation: "alirafiq", user_role: 2, uphone: "+923343359871", uaddress: "Wood Basin, Clifton, Karachi"},
    {uname: "Shayan Shafi", email: "shayan@live.com", password: "shayanshafi", password_confirmation: "shayanshafi", user_role: 3, uphone: "+923342084026", uaddress: "Lyari, Karachi"}
]


# creating companies and products
companies.each do |c|
    comp = Company.create! c

    # (products[comp.cname.downcase]).each do |p|
    #     comp.products.create p
    # end
end

# creating users
users.each do |u|
    user = User.create! u
end
