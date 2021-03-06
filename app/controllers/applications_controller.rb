class ApplicationsController < ApplicationController
  after_action  :judge_application_status , :only => [:agree, :reject]

  include VoteModule

  def show
    debugger

    @application = Application.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @application }
    end
  end

  def new
    @group = Group.find(params[:group_id])
    @application = Application.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @application }
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @application = Application.new(application_params)


    respond_to do |wants|
      if user_in_group? 
          flash[:notice] = 'You have in this group.'
          wants.html { render (@group) }
      else

        if  @application.save
          flash[:notice] = 'applicatin was successfully created.'
          wants.html { redirect_to(@group) }
          wants.xml { render :xml => @application, :status => :created, :location => @application }
        else
          flash[:notice] = 'applicatin was failed created.'
          wants.html { redirect_to(@group) }
          #wants.html { render :action => "new" }
          #wants.xml { render :xml => @application.errors, :status => :unprocessable_entity }
        end
      end

      wants.js
    end
  end
  

  def agree
    upvotes
  end

  def reject
    downvotes
  end

  def destroy
    @application = Application.find_by(params[:id])
    @application.destroy
  
    respond_to do |format|
      format.html { redirect_to(applications_url) }
      format.xml  { head :ok }
    end
  end

  private

  def user_in_group?
    @group.users.include? current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def application_params
    permit_params =params.require(:application).permit(:content)
    permit_params[:user_id] = current_user.id
    permit_params[:group_id] = params[:group_id]
    return permit_params
  end

  #需要通知系统来给用户反馈
  def judge_application_status
    if @voteable.get_upvotes.size - @voteable.get_downvotes.size >= 2 || (@group.users.count < 3 && @voteable.get_upvotes.size >= 1)
      @voteable.status = 1
      @group.users << @voteable.user 
      if @group.save
        @notification = Notification.create(title:t(:join_group_title), content:t(:join_group_message , group_name: @group.name) ,user_id:@voteable.user.id) 
      end
    elsif @voteable.get_downvotes.size - @voteable.get_upvotes.size >= 2 
      @voteable.status = -1 
      destroy 
      @notification = Notification.create(title:t(:reject_join_group_title), content:t(:reject_join_group_message, group_name: @group.name) ,user_id:@voteable.user.id) 
    else
      @voteable.status = 0
    end

    @voteable.save
  end
    

end
