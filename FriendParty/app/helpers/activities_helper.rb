module ActivitiesHelper 

  def tracked?(activity)
    current_user.track_activities.include?(activity)
  end

  def participate?(activity)
    current_user.participate? activity
  end

  def upvoted?(activity)
    current_user.voted_up_on? activity
  end

  def downvoted?(activity)
    current_user.voted_down_on? activity
  end


  #create track button
  def track_tag(activity)
    method = tracked?(activity) ? "untrack" : "track"
    div = content_tag("div",track_icon_tag(activity),{"class" => "btn btn-primary", "data-method" => "#{method}", "data-type" => "#{controller_name}" , "data-id" => "#{activity.id}" , "id" => "track-item"})  
    div
  end

  def track_icon_tag(activity)
    class_content = tracked?(activity) ?  'fa fa-heart fa-2x' : 'fa fa-heart-o fa-2x'
   "<i class='#{class_content}'></i>".html_safe
  end

  #create participate button 
  def participate_tag(activity)
    method = participate?(activity) ? "dropout" : "participate"
    div = content_tag("div",participate_icon_tag(activity),{"class" => "btn btn-primary", "data-method" => "#{method}", "data-type" => "#{controller_name}" , "data-id" => "#{activity.id}" , "id" => "participate-item"})  
    div
  end

  def participate_icon_tag(activity)
    class_content = participate?(activity) ?  'fa fa-sign-in fa-2x' : 'fa fa-sign-out fa-2x'
   "<i class='#{class_content}'></i>".html_safe
  end



end
