module ApplicationHelper

  def alert_type(type)

    alert_type = type 
    if type.to_s == "notice"
      alert_type = "success" 
    elsif type.to_s == "alert"
      alert_type = "danger"
    end

    alert_type
  end

  def user_in_group?(group)
    group.users.include? current_user
  end

  def render_markdown(markdown_content)
    if !markdown_content
      return ""
    end
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(markdown_content)
  end

  def format_time(time)
    time.strftime "%Y-%m-%d %H:%M"
  end

  #create favorite button
  def favorite_tag(favoritable)
    method = favoritable.favorite.try(:favorite_by_user?,current_user) ? "delete" :"post"
    div = content_tag("div",favorite_icon_tag(favoritable),{"class" => "favoritable btn btn-primary", "data-method" => "#{method}", "data-type" => "#{controller_name}" , "data-id" => "#{favoritable.id}" , "id" => "favoritable"})  
    div
  end

  def favorite_icon_tag(favoritable)
    class_content = favoritable.try(:favorite).try(:favorite_by_user?,current_user) ?  'fa fa-heart fa-2x' : 'fa fa-heart-o fa-2x'
   "<i class='#{class_content}'></i>".html_safe
  end

  #track activity event
  def track_activity_event
    events = []
    last_activity = current_user.track_activities.last
    if last_activity 
      events = last_activity.events
    end

    events
  end

end
