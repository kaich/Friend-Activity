module GroupsHelper

  def like_icon_class(likeable)
   class_content = likeable.liked_by_user?(current_user) ?  'fa fa-heart fa-2x' : 'fa fa-heart-o fa-2x'
   "<i class='#{class_content}'></i>".html_safe
  end

end
