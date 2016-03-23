class Company < ActiveRecord::Base
    validates :cname, presence: true
    validates :ctype, presence: true, length: { minimum: 5 }

    mount_uploader :clogo, CompLogoUploader

    has_one :user
    has_many :products, :dependent => :destroy
end