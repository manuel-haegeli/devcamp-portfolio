module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      (link_to 'Logout', destroy_user_session_path, method: :delete) +
        content_tag(:br) +
        (link_to 'Userprofile', edit_user_registration_path)
    else
      (link_to 'Login', new_user_session_path) +
        content_tag(:br) +
        (link_to 'Register', new_user_registration_path)
    end
  end

  def referral_helper
    content_tag(:p, "Thanks for visiting me from #{session[:referral]}") if session[:referral]
  end
end
