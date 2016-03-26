class Company < ActiveRecord::Base
  # Validations
  validates :cname, presence: true, length: { minimum: 5 }
  validates :ctype, presence: true, inclusion: { in: ["Clothing", "Electronics", "Personal Care"] }
  validates :caddress, presence: true, length: {minimum: 5}
  validates_format_of :cemail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :cphone_official, presence: true, format: { with: /\A[0-9]{8,15}\z/, message: "Valid format: 923001122333" }
  validates :cphone_personal, presence: true, format: { with: /\A[0-9]{8,15}\z/, message: "Valid format: 923001122333" }
  validates :clogo, presence: true

  # Logo Uploaders
  mount_uploader :clogo, CompLogoUploader

  # Associations
  has_one :user
  has_many :products, :dependent => :destroy
private
  def get_categories

  end
end