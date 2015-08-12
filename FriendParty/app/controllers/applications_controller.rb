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
    @application = Application.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @application }
    end
  end

  def create
    @group = Group.find(params[:group_id])
    @application = @group.applications.build(application_params)

    respond_to do |wants|
      if @group.save
        flash[:notice] = 'applicatin was successfully created.'
        wants.html { redirect_to(@group) }
        wants.xml { render :xml => @application, :status => :created, :location => @application }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @application.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  def agree
   debugger   
  end

  def reject
  debugger    
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
  
    respond_to do |format|
      format.html { redirect_to(applications_url) }
      format.xml  { head :ok }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def application_params
    permit_params =params.require(:application).permit(:content)
    permit_params[:user_id] = current_user
    return permit_params
  end


end
