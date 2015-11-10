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

  #create like button
  def like_tag(likeable)
    method = likeable.like.try(:liked_by_user?,current_user) ? "delete" :"post"
    div = content_tag("div",like_icon_tag(likeable),{"class" => "likeable btn btn-primary", "data-method" => "#{method}", "data-type" => "#{controller_name}" , "data-id" => "#{likeable.id}" , "id" => "likeable"})  
    div
  end

  def like_icon_tag(likeable)
    class_content = likeable.try(:like).try(:liked_by_user?,current_user) ?  'fa fa-heart fa-2x' : 'fa fa-heart-o fa-2x'
   "<i class='#{class_content}'></i>".html_safe
  end

end
