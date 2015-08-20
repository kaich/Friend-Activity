class EventsController < ApplicationController
  def index
    @events = Event.all
  
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
    
    respond_to do |wants|
      if @event.save
        flash[:notice] = ' was successfully created.'
        wants.html { redirect_to(@event) }
        wants.xml { render :xml => @event, :status => :created, :location => @event }
      else
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
        flash[:notice] = ' was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def event_params
    params.require(:event).permit(:name ,:content,:start_time ,:end_time)
  end
  
end
