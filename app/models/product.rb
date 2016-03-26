class Product < ActiveRecord::Base
  # Validations
  validates :pname, presence: true, length: { minimum: 3 }
  validates :pname, presence: true, length: { in: 10..30 }
  validates :psize, presence: true, inclusion: {in: ["S", "M", "L", "XL"]}
  validates :pprice, presence: true, numericality: { only_integer: true, greater_than: 10 }
  validates :pstock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  
  validates :pcategory, presence: true
  validates :psubcategory, presence: true
  validates :pdetailcategory, presence: true

  validates :pimage1, presence: true
  validates :pimage2, presence: true
  validates :pimage3, presence: true

  # Image Uploaders
  mount_uploader :pimage1, MainImageUploader
  mount_uploader :pimage2, ImageUploader
  mount_uploader :pimage3, ImageUploader

  # Associations
  belongs_to :company
  has_many :order_items

  # default_scope { where(active: true) }
end
