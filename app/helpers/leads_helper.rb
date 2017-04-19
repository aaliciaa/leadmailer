module LeadsHelper
  def set_leads_active_button
    current_page?(leads_path) ? "nav-links-active" : ""
  end
end
