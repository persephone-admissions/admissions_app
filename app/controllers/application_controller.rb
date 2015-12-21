class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # We can call these methods from other controllers
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  # set the current_user instance variable if we have a session
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # This allows us to call current_user in our views
  helper_method :current_user

  # Allows us to check for a logged in user
  def authorize
    redirect_to '/login' unless current_user
  end

  def authenticate_employee
    redirect_to '/' unless current_user.type == "Instructor" || current_user.type == "Officer"
  end

end
