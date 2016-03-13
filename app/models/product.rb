class Product < ActiveRecord::Base
  belongs_to :company
  has_many :order_items

  default_scope { where(active: true) }
end
