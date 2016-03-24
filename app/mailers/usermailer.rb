class Usermailer < ApplicationMailer
  default from: "notification@milega.com"

  def orderreceived_email(ship_detail)
    @ship_detail = ship_detail
    mail(to: ship_detail.semail, subject: "Your order has been received!")
  end
end
