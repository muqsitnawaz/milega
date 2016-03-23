class Product < ActiveRecord::Base
  belongs_to :company
  has_many :order_items

  mount_uploader :pimage1, MainImageUploader
  mount_uploader :pimage2, ImageUploader
  mount_uploader :pimage3, ImageUploader

  # default_scope { where(active: true) }
end
