module WelcomeHelper

  def nav_href(href)
   current_page?('/') ? href : "/#{href}"
  end

end
