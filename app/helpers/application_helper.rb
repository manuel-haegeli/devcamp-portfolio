module ApplicationHelper
  def login_helper style
    if current_user.is_a?(GuestUser)
      (link_to 'Login', new_user_session_path, class: style) +
        (link_to 'Register', new_user_registration_path, class: style)
    else
      (link_to 'Logout', destroy_user_session_path, method: :delete, class: style) +
        (link_to 'Userprofile', edit_user_registration_path, class: style)
    end
  end

  def referral_helper
    content_tag(:p, "Thanks for visiting me from #{session[:referral]}") if session[:referral]
  end

  def copyright_helper
    @copyright = DevcampViewTool::Renderer.copyright 'Manuel Hägeli', 'All rights reserved'
  end
end
