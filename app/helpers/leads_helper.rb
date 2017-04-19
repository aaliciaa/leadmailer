module LeadsHelper
  def set_leads_active_button
    current_page?(leads_path) ? "nav-links-active" : ""
  end

  def conversion_rate_for(lead_selection, total_leads)
    return (lead_selection.count.to_f / total_leads.count * 100).round(2)
  end

  def count_leads_since(time_period)
    Lead.where("created_at > ?", time_period).count
  end

  def calculate_ranking(users)
    ranking = {}
    users.all.each do |user|
      ranking[user.name] = conversion_rate_for(user.leads.where(status: "settled"), user.leads)
    end
    ranking.sort_by { |key, value| value }.last.first
  end
end
