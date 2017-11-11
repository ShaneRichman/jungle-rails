class UserMailer < ApplicationMailer

  def order_email(order)
    @order = order
    mail(to: @order.email, subject: "Here is your receipt for order #id: #{order.id}")
  end
end