class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @comment }
    end
  end


  def create
    @group = Group.find(params[:group_id])
    @activity = Activity.find(params[:activity_id])
    final_param = comment_params
    @comment = @activity.comments.build(final_param)
    @comment.user = current_user
    
    respond_to do |wants|
      if params[:controller] == self.class.to_s

        if @comment.save
          flash[:notice] = 'Comment was successfully created.'
          wants.html { redirect_to(@comment) }
          wants.xml { render :xml => @comment, :status => :created, :location => @comment }
        else
          wants.html { render :action => "new" }
          wants.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
        end

      else

        if @comment.save
          flash[:notice] = 'Comment was successfully created.'
          wants.html { redirect_to(group_activity_url(@group , @activity)) }
          wants.xml { render :xml => @comment, :status => :created, :location => @comment }
        end

      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
  
    respond_to do |format|
      if @comment.update(comment_params)
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  
    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
  
 private 

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end

end
