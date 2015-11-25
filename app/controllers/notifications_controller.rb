class NotificationsController < ApplicationController

  def index
    @notifications = Notification.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @notifications }
    end

  end

  def new
    @notification = Notification.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @notification }
    end
  end

  def create
    @notification = Notification.new(params[:notification])
    
    respond_to do |wants|
      if @notification.save
        flash[:notice] = ' was successfully created.'
        wants.html { redirect_to(@notification) }
        wants.xml { render :xml => @notification, :status => :created, :location => @notification }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @notification = Notification.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @notification }
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
  
    respond_to do |format|

      format.js
      format.html { redirect_to(notifications_url) }
      format.xml  { head :ok }
    end
  end

end
