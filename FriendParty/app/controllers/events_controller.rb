class EventsController < ApplicationController
  def index
    @activity = Activity.find_by_id(params[:activity_id])
    @events = @activity.events.paginate(:page => params[:page], :per_page => 20)
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @eventss }
    end
  end

  def new
    @event = Event.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @event }
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    
    respond_to do |wants|
      if @event.save
        flash[:success] = ' was successfully created.'
        wants.html { redirect_to(@event) }
        wants.xml { render :xml => @event, :status => :created, :location => @event }
      else
        flash[:danger] = ' was failed created.'
        wants.html { render :action => "new" }
        wants.xml { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @event }
    end
  end

  def update
    @event = Event.find(params[:id])
  
    respond_to do |format|
      if @event.update(event_params)
        flash[:success] = ' was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        flash[:danger] = ' was successfully updated.'
        format.html { render action: 'edit' }
        format.xml  { render xml: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def event_params
    params.require(:event).permit(:name ,:content,:start_time ,:end_time,:activity_id)
  end
  
end
