class ApplicationsController < ApplicationController
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
          wants.html { redirect_to(@group) }
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
    end
  end
  

  def agree
    @application = Application.find(params[:id])
    @application.agree_count += 1
    group = @application.group
    group.users << @application.user

    judge_application_status

    if group.save
      flash[:notice] = 'successfully join group.'
    else
      flash[:notice] = 'failed join group.'
    end

  end

  def reject
    @application = Application.find(params[:id])
    @application.reject_count += 1
    group = @application.group
    group.users << @application.user

    judge_application_status

    if group.save
      flash[:notice] = 'successfully join group.'
    else
      flash[:notice] = 'failed join group.'
    end

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

  #有问题
  def judge_application_status
    if @application.agree_count - @application.reject_count > 3 
      @application.status = 1
    elsif @application.reject_count - @application.agree_count > 3
      @application.status = -1 
      destroy 
    else
      @application.status = 0
    end
  end

end
