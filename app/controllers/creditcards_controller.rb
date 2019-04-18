class CreditcardsController < ApplicationController
  protect_from_forgery except:  [:create]
  skip_before_action :delete_user
  before_action :move_to_root,unless: :user_signed_in?
  def index
  end

  def edit
  end

  def new
    gon.key = PAYJP_PUBLIC_KEY
    @creditcard=Creditcard.new
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
      customer = Payjp::Customer.create(
      card: params[:pay_id]
    )
    card = Card.new(
      pay_id: params[:pay_id],
      customer_id: customer.id,
      user_id: current_user.id)
    card.save
    redirect_to complete_path
  end

  private

  def move_to_root
    redirect_to root_path
  end
end
