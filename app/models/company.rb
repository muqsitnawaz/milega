class Company < ActiveRecord::Base
    validates :cname, presence: true
    validates :ctype, presence: true, length: { minimum: 5 }

    has_one :user
    has_many :products, :dependent => :destroy
end
