class OrdersController < ApplicationController
  def new
  end

  def create
    @amount = (current_user_cart_total * 100).to_i
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Paiment de #{current_user.first_name} #{current_user.last_name}",
      currency: 'eur',
      })
    
    @items = current_user_cart.items
    @order = Order.new(user: current_user, items: @items)
    if @order.save
      # empty the user cart
      empty_current_user_cart
      flash.now[:alert] = 'Commande validée !'

      # Insert here the code to charge the credit card, the code will use stripeToken
    else
      flash[:error] = @order.errors.full_messages.to_sentence
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      render :new
  end
end