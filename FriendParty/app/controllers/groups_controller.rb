class GroupsController < ApplicationController
  before_action :authenticate_user! , only:[:create ,:destroy]

  def new
    @group = Group.new  
  end

  def create
    @group = current_user.groups.build(group_params)
    
    respond_to do |wants|
      if @group.save
        flash[:notice] = ' was successfully created.'
        wants.html { redirect_to(@group) }
        wants.xml { render :xml => @group, :status => :created, :location => @group }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index 
    current_user.groups
  end
  

  private 

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:todo).permit(:name, :intro)
  end
end
