module LeadsHelper
  def set_leads_active_button
    current_page?(leads_path) ? "nav-links-active" : ""
  end

  def count_leads_since(time_period)
    Lead.where("created_at > ?", time_period).count
  end

  def global_conversion_rate_for(lead_selection, total_leads)
    return (lead_selection.count.to_f / total_leads.count * 100).round(2)
  end

  # ranking calculations:
  def calculate_ranking(users)
    ranking = []
    users.each do |user|
      ranking << {name: user.name, conversion: conversion_rate_for(user), rank: nil}
#     ranking << {name: user.name, conversion: conversion_rate_for(user), photo: user.photo}
    end
    ranking.sort_by { |hsh| hsh[:conversion] }.reverse
    # result -> [{name: biz, conversion: 23, ranking: nil}, {}, {}]
    # ranking.map.with_index { |hsh, i| { name: hsh[:name], conversion: hsh[:conversion], rank: (i + 1) } }
  end

  def conversion_rate_for(user)
    lead_conversion_count = user.leads.where(status: "settled").count.to_f
    total_leads_count = user.leads.where(status: ["settled", "lost"]).count.to_f
    if total_leads_count != 0.0
      return (lead_conversion_count / total_leads_count * 100).round(2)
    else
      return 0.0
    end
  end

  def find_user_ranking(user, users)
    ranking_matrix = calculate_ranking(users)
    ranking = ranking_matrix.find_index { |salesperson| salesperson[:name] == user.name } + 1
  end

  def store_user_rankings(users)
    # users -> User.all -> this is all you need to access this method
    # calculate rankings, result -> [{name: biz, conversion: 23, ranking: 1}, ...]
    rankings = calculate_ranking(users)
    # store ranking to user instance
    users.each do |user|
      user.rank = rankings.find_index { |salesperson| salesperson[:name] == user.name } + 1
    end
  end
end
