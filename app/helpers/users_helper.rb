module UsersHelper

  def set_users_active_button
    current_page?(users_path) ? "nav-links-active" : ""
  end
end
