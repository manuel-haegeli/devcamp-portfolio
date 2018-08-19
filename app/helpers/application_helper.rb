module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      [
        (link 'Login', new_user_session_path, style),
        (link 'Register', new_user_registration_path, style)
      ]
    else
      [
        (link_to 'Logout', destroy_user_session_path, method: :delete, class: "#{style} #{active? destroy_user_session_path}"),
        (link 'Userprofile', edit_user_registration_path, style)
      ]
    end
  end

  def referral_helper
    content_tag(:p, "Thanks for visiting me from #{session[:referral]}") if session[:referral]
  end

  def copyright_helper
    @copyright = DevcampViewTool::Renderer.copyright portfolio_brand, 'All rights reserved'
  end

  def portfolio_brand
    'Manuel Hägeli'
  end

  def nav_list(style = '')
    [
      (link 'Home', root_path, style),
      (link 'About Me', about_path, style),
      (link 'Contact', contact_path, style),
      (link 'Blog', blogs_path, style),
      (link 'Portfolio', portfolios_path, style)
    ]
  end

  def active?(path)
    'active' if current_page? path
  end

  def link(name, path, style)
    link_to name, path, class: "#{style} #{active? path}"
  end

  def alerts(message = '')
    alert = (flash[:alert] || flash[:error] || flash[:notice] || message)
    generate_alert alert
  end

  def generate_alert(message = '')
    js add_gritter(message, title: portfolio_brand, sticky: false) if message
  end
end
