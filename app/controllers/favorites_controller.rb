class FavoritesController < ApplicationController
  def create
    status = Status.find(params[:status_id])
    favorite = current_user.favorites.new(status_id: status.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    status = Status.find(params[:status_id])
    favorite = current_user.favorites.find_by(status_id: status.id)
    favorite.destroy
    redirect_to request.referer
  end
end
