module ActivitiesHelper 

  def tracked?(activity)
    current_user.track_activities.include?(activity)
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

end
