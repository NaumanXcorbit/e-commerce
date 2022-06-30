class OrderMailer < ApplicationMailer
  def send_email(order)
    @line_items = order.line_items
    mail(to: "#{order.user.first_name} <#{order.user.email}>", subject: "Order Details")
  end
end
