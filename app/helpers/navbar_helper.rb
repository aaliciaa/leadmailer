module NavbarHelper
  def greet
    now = Time.zone.now
    today = Date.today.to_time

    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    tomorrow = today.tomorrow

    if (morning..noon).cover? now
      'Good morning'
    elsif (noon..evening).cover? now
      'Good afternoon'
    elsif (evening..tomorrow).cover? now
      'Good evening'
    end
  end
end
