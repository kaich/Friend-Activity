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

end
