class GroupsController < ApplicationController
  before_action :authenticate_user! 

  def new
    @group = Group.new  
  end

  def create
    @group = current_user.groups.build(group_params)
    
    respond_to do |wants|
      if current_user.save
        flash[:notice] = ' was successfully created.'
        wants.html { redirect_to(@group) }
        wants.xml { render :xml => @group, :status => :created, :location => @group }
      else
        flash[:notice] = "unsuccessfully created..."
        wants.html { render :action => "new" }
        wants.xml { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end


  def index
    @groups = current_user.groups.paginate(:page => params[:page], :per_page => 20)
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @model_class_names }
    end
  end

  
  def search
    @groups = Group.search(params[:search])
  end


  def show
    @group = Group.find(params[:id])
    @users = @group.users.paginate(:page => params[:page],:per_page => 10)
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @group }
    end
  end


  private 

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name, :intro)
  end
end
