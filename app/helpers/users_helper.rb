module UsersHelper

  def set_users_active_button
    current_page?(users_path) ? "nav-links-active" : ""
  end

  def availability_status_for(user)
    user.available ? "Available" : "Unavailable"
  end
end
