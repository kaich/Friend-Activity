module ApplicationHelper

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
