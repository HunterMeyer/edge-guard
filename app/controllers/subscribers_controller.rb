class SubscribersController < ApplicationController
  def new
    @subscriber = subscriber_type.new
  end

  def create
    @subscriber = subscriber_type.create(subscriber_params)
    if @subscriber.save
      redirect_to send("after_create_path_for_#{@subscriber.type.downcase}")
    else
      render :new
    end
  end

  def update
    @subscriber = subscriber_type.find(params[:id])
    if @subscriber.update(subscriber_params)
      redirect_to send("thankyou_#{@subscriber.type.downcase}_path", @subscriber.id)
    else
      render :checkout
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
    params.require(subscriber_type.to_s.downcase).permit(:first_name, :last_name, :email, :phone,
      :sponsors_name, :gamer_tag, :gamer_prefix, :region, :country, :sponsored, :customer_token
    )
  end

  def after_create_path_for_player
    checkout_player_path(@subscriber.id)
  end

  def after_create_path_for_spectator
    checkout_spectator_path(@subscriber.id)
  end

  def after_create_path_for_volunteer
    thankyou_volunteer_path(@subscriber.id)
  end
end
