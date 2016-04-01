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

  validates :p_c1_image1, presence: true
  validates :p_c1_image2, presence: true
  validates :p_c1_image3, presence: true

  # Image Uploaders
  mount_uploader :p_c1_image1, MainImageUploader
  mount_uploader :p_c1_image2, ImageUploader
  mount_uploader :p_c1_image3, ImageUploader

  mount_uploader :p_c2_image1, ImageUploader
  mount_uploader :p_c2_image2, ImageUploader
  mount_uploader :p_c2_image3, ImageUploader

  mount_uploader :p_c3_image1, ImageUploader
  mount_uploader :p_c3_image2, ImageUploader
  mount_uploader :p_c3_image3, ImageUploader

  mount_uploader :p_c4_image1, ImageUploader
  mount_uploader :p_c4_image2, ImageUploader
  mount_uploader :p_c4_image3, ImageUploader

  mount_uploader :p_c5_image1, ImageUploader
  mount_uploader :p_c5_image2, ImageUploader
  mount_uploader :p_c5_image3, ImageUploader

  mount_uploader :p_c6_image1, ImageUploader
  mount_uploader :p_c6_image2, ImageUploader
  mount_uploader :p_c6_image3, ImageUploader

  # Associations
  belongs_to :company
  has_many :order_items

  # default_scope { where(active: true) }
end
