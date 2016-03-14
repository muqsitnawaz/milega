class Order < ActiveRecord::Base
  has_many :order_items
  has_one :shipping_detail
  before_save :update_subtotal

  validates :order_status, :inclusion => { :in => %w(new confirmed in-transit sent delivered) }

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private
  #def set_order_status
  #  self.order_status_id = 1
  #end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end