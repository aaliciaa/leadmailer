# user becomes available OR add new user

class AdjustLineupService
  def initialize(user)
    @user = user
  end

  def add
    bumped_lineup = Lineup.first.lineup
    bumped_lineup << @user
    Lineup.destroy_all
    Lineup.create(:lineup => bumped_lineup)
  end

   def remove
    bumped_index = Lineup.first.lineup.find_index(@user)
    bumped_lineup = Lineup.first.lineup
    bumped_lineup.delete_at(bumped_index)
    Lineup.destroy_all
    Lineup.create(:lineup => bumped_lineup)
  end
end





