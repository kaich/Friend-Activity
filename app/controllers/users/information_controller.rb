class Users::InformationController < ApplicationController

  def edit
    @user = current_user 
  end

  def update
    @user =  current_user
  
    respond_to do |format|
      if @user.update(user_params)
        flash[:notice] = ' was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name,:real_name,:avatar_cache,:qq_number,:job,:home_address,:current_address,:signature,:intr) 
  end

end
