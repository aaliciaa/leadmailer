class Customer < ApplicationRecord
  serialize :lineup, Array

  has_many :leads
  has_many :users


  def Customer.buildLinups(users)
    # if Lineup.count < 1 || Lineup.first.lineup == nil
      Customer.all.each do |customer|
        customerName = customer.name
        lineup = []
        lineup = users.select do |user|
          (user.customer.name == customerName) && user.available
        end
        puts lineup
        adjustedCustomer = customer
        adjustedCustomer.lineup = lineup
        adjustedCustomer.save!
        puts adjustedCustomer
      end
    Customer.all.each do |customer|
      puts customer.lineup
    end
  end


  def bump(customer)
    # from user from 1st pos to last
    # the customer object is passed as the arguement
    bumped_lineup = customer
    bumped_lineup.lineup = bumped_lineup.lineup.rotate(1)
    bumped_lineup.save
  end

end
