class Product < ActiveRecord::Base
  belongs_to :company
  has_many :order_items

  mount_uploader :image1, MainImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  # default_scope { where(active: true) }
end
