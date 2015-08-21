class ActivitiesController < ApplicationController
  before_action :authenticate_user! 

  def index
    @activities = Activity.all.paginate(:page => params[:page],:per_page => 20)
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @activities }
    end
  end

  def new
    @activity = Activity.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @activity }
    end
  end

  def create
    @activity = Activity.new(activity_params)
    
    respond_to do |wants|
      if @activity.save
        flash[:notice] = 'activity was successfully created.'
        wants.html { redirect_to(@activity) }
        wants.xml { render :xml => @activity, :status => :created, :location => @activity }
      else
        flash[:notice] = 'activity was failed created.'
        wants.html { render :action => "new" }
        wants.xml { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @activity = Activity.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @activity }
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  
    respond_to do |format|
      format.html { redirect_to(activitys_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def activity_params
   final_params = params.require(:activity).permit([:name,:content,:start_time,:end_time])
   final_params[:originator_id]=current_user.id
   final_params[:group_id] = params[:group_id]
   return final_params
  end
end
