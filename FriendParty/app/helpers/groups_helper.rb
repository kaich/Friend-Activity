module GroupsHelper

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
