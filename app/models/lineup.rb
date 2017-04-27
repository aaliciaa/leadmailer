class Lineup < ApplicationRecord
  serialize :lineup


  def Lineup.build(users)
    # if Lineup.count < 1 || Lineup.first.lineup == nil
      Lineup.destroy_all
      lineup = []
      lineup = users.select do |user|
        user.available
      end
      Lineup.create(:lineup => lineup)
      Lineup.first.lineup
  end


  def bump
    # from user from 1st pos to last
    # not sure if this rotate works they way I think it does -revisit
    bumped_lineup = Lineup.first.lineup.rotate(1)
    Lineup.destroy_all
    Lineup.create(:lineup => bumped_lineup)
  end
end
