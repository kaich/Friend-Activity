class LikesController < ApplicationController
  before_action :find_likeable

  def create
    current_user.like @likeable_item 
  end


  def destory 
    debugger
    current_user.unlike @likeable_item
  end

  private 

  def find_likeable
    @likeable_item = Group.find_by_id(params[:id]).like
    if !@likeable_item
      item = Group.find_by_id(params[:id])
      @likeable_item = Like.new(likeable: item) if item 
    end 

    @likeable_item
  end
  
end
