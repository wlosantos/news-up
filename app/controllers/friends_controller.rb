class FriendsController < ApplicationController

  before_action :set_friend, only: %i[ update ]

  def create
    friend = current_user.friends.build friend_params

    if friend.save

      render json: {successfull: true}
      flash[:notice] = 'Solicitação enviada com sucesso!!!'
    else
      render json: {succesfull: false}
    end
  end

  def update
    if @friend.update(friend_params)
      render json: {successfull: true}
    else
      render json: {successfull: false}
    end
  end

  private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:friend, :status)
  end

end
