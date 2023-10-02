class CheckoutsController < ApplicationController
  def show
    @session = Stripe::Checkout::Session.create(
      line_items: [{
        price_data: {
          currency: "usd",
          product_data: {
            name: product.name
          },
          unit_amount: (product.price * 100).to_i
        },
        quantity: 1
      }],
      mode: "payment",
      ui_mode: "embedded",
      return_url: CGI.unescape(payments_url(session_id: '{CHECKOUT_SESSION_ID}'))
    )

    Order.create(session_id: session.id, stripe_checkout_id: @session.id)
    # current_user.orders.create(stripe_checkout_id: @session.id)
  end

  private

  def product
    @product ||= Product.find(params[:id])
  end
end
