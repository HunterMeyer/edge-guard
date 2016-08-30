class SubscribersController < ApplicationController
  def new
    @subscriber = subscriber_type.new
  end

  def create
    @subscriber = subscriber_type.create(subscriber_params)
    if @subscriber.save
      redirect_to send("after_create_path_for_#{@subscriber.type}")
    else
      render :new
    end
  end

  def checkout
    @subscriber = subscriber_type.find(params[:id])
  end

  def thankyou
    @subscriber = subscriber_type.find(params[:id])
  end

  private

  def subscriber_type
    params[:type].smart_constantize
  end

  def subscriber_params
    params.require(params[:type]).permit(:first_name, :last_name, :email, :phone,
      :sponsors_name, :gamer_tag, :gamer_prefix, :region, :country, :sponsored
    )
  end

  def after_create_path_for_player
    subscriber_checkout_path(@subscriber.id)
  end

  def after_create_path_for_spectator
    subscriber_checkout_path(@subscriber.id)
  end

  def after_create_path_for_volunteer
    thankyou_path(@subscriber.id)
  end
end
