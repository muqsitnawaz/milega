class ShippingDetail < ActiveRecord::Base
  VALID_STATES = %w( Punjab Sindh KPK NWFP Balochistan Kashmir )
  validates :sname, presence: true, length: { minimum: 5 }
  validates :semail, presence: true
  validates_format_of :semail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :sphone, presence: true, numericality: true
  validates :saddress, presence: true, length: {minimum: 5}
  validates :sstate, presence: true, :inclusion => { in: VALID_STATES  }
  
  belongs_to :order
end
