class ActivitiesController < ApplicationController
  before_action :authenticate_user! 

  include ActivitiesHelper
  include VoteModule

  def index
    @group=Group.find(params[:group_id])
    @activities = @group.activities.paginate(:page => params[:page],:per_page => 20)
  
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
        flash[:success] = 'activity was successfully created.'
        wants.html { redirect_to({action: "show", id: @activity.id}) }
        wants.xml { render :xml => @activity, :status => :created, :location => @activity }
      else
        flash[:danger] = 'activity was failed created.'
        wants.html { render :action => "new" }
        wants.xml { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @group=Group.find(params[:group_id])
    @activity = Activity.find(params[:id])
    @voteable = @activity
    generate_chart(@activity,@activity.group.users.count)
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @activity }
    end
  end

  def preview
    # Initializes a Markdown parser
    result = render_markdown params[:body]
    
    render text: result

  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  
    respond_to do |format|
      format.html { redirect_to(activitys_url) }
      format.xml  { head :ok }
    end
  end

  def track
    @activity = Activity.find(params[:id])
    if !tracked? @activity
      current_user.track_activities << @activity
      current_user.save
    end 
  end

  def untrack
    @activity = Activity.find(params[:id])
    if tracked? @activity
      current_user.track_activities.delete @activity
      current_user.save
    end 
  end

  def participate
    @activity = Activity.find(params[:id])
    if participate? @activity 
      current_user.participant_activities << @activity
      current_user.save
    end
  end

  def dropout
    @activity = Activity.find(params[:id])
    if participate? @activity 
      current_user.participant_activities.delete @activity
      current_user.save
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
