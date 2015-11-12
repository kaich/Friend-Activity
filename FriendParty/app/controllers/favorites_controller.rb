class FavoritesController < ApplicationController
  before_action :find_favoritable

  def create
    current_user.add_favorite @favoritable_item 
  end


  def destroy 
    current_user.remove_favorite @favoritable_item
  end

  private 

  def find_favoritable
    @favoritable_item = Group.find_by_id(params[:id]).try(:favorite)
    if !@favoritable_item
      item = Group.find_by_id(params[:id])
      @favoritable_item = Favorite.new(favoritable: item) if item 
    end 

    @favoritable_item
  end
  
end
