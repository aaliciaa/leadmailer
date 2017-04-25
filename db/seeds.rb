

# This file generates:
# 4 Users, 21 Leads
  # User w/ 8 leads - 2 unaccepted / 2 accepted / 2 settled / 2 lost - Alicia Bolton
  # User w/ no leads - Taryn Baron
  # User w/ 5 accepted leads but no closures - Nicole Smith
  # User w/ 8 leads - 2 accepted / 2 settled / 2 lost - Christie Clark - Do Not Touch! please :)


require 'faker'

User.destroy_all
Lead.destroy_all

# 1 user, 8 leads:
alicia = User.create(name: "Alicia Bolton", email: "alicia.bolton@hotmail.com", password: "123456", photo: "QT_0063.jpg", rank: nil)

alicia_leads = []
8.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  lead = Lead.new(
    name: lead_name,
    email: "#{email_name}@outlook.com",
    phone: Faker::PhoneNumber.cell_phone,
    received_at: Time.now(),
    status: "pending",
    user: alicia,
    source: ["Car Kijiji", "Truck Sales", "Alibaba"].sample,
    )
  lead.save!
  alicia_leads << lead
end

 alicia_leads[0..5].each do |lead|
    lead.accepted_at = DateTime.now
    lead.response_time = lead.accepted_at - lead.created_at
    lead.status = "accepted"
    lead.save
  end

  alicia_leads[0..1].each do |lead|
    lead.status = "settled"
    lead.save
  end

   alicia_leads[2..3].each do |lead|
    lead.status = "lost"
    lead.save
  end

# end-cases:

# user with no leads
taryn = User.create(name: "Taryn Baron", email: "taryn.baron@hotmail.com", password: "123456", photo: "QS_0015.jpg", rank: nil)

# user with accepted leads but no closures
nicole = User.create(name: "Nicole Smith", email: "nicole.smith@hotmail.com", password: "123456", photo: "QS_0067.jpg", rank: nil)
5.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  nicole_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: nicole,
  source: "Heavy Equip Inc"
  )
  nicole_lead.save!
end

# user with accepted leads: 2 lost, 2 settled, 2 accepted
mike = User.create(name: "Mike Morneau", email: "mike.morneau@hotmail.com", password: "123456", photo: "QS_0082.jpg", rank: nil)
mike_leads = []
8.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  mike_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: mike,
  source: "Heavy Equip Inc"
  )
  mike_lead.save!
  mike_leads << mike_lead
end

mike_leads[0..5].each do |lead|
  lead.accepted_at = DateTime.now
  lead.response_time = lead.accepted_at - lead.created_at
  lead.status = "accepted"
  lead.save
end

mike_leads[0..1].each do |lead|
  lead.status = "settled"
  lead.save
end

mike_leads[2..3].each do |lead|
  lead.status = "lost"
  lead.save
end




# user with accepted leads: 2 lost, 2 settled, 2 accepted
christie = User.create(name: "Christie Clark", email: "christie.clark@hotmail.com", password: "123456", photo: "QS_0123.jpg", rank: nil)
christie_leads = []
8.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  christie_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: christie,
  source: "Heavy Equip Inc"
  )
  christie_lead.save!
  christie_leads << christie_lead
end

christie_leads[0..5].each do |lead|
  lead.accepted_at = DateTime.now
  lead.response_time = lead.accepted_at - lead.created_at
  lead.status = "accepted"
  lead.save
end

christie_leads[0..1].each do |lead|
  lead.status = "settled"
  lead.save
end

christie_leads[2..3].each do |lead|
  lead.status = "lost"
  lead.save
end




# user with accepted leads: 2 lost, 2 settled, 2 accepted
john = User.create(name: "John Jones", email: "john.jones@hotmail.com", password: "123456", photo: "QS_0061.jpg", rank: nil)
john_leads = []
8.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  john_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: john,
  source: "Heavy Equip Inc"
  )
  john_lead.save!
  john_leads << john_lead
end

john_leads[0..5].each do |lead|
  lead.accepted_at = DateTime.now
  lead.response_time = lead.accepted_at - lead.created_at
  lead.status = "accepted"
  lead.save
end

john_leads[0..1].each do |lead|
  lead.status = "settled"
  lead.save
end

john_leads[2..3].each do |lead|
  lead.status = "lost"
  lead.save
end




# user with accepted leads: 2 lost, 2 settled, 2 accepted
jim = User.create(name: "Jim Krats", email: "jim.krats@hotmail.com", password: "123456", photo: "QS_0039.jpg", rank: nil)
jim_leads = []
8.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  jim_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: jim,
  source: "Heavy Equip Inc"
  )
  jim_lead.save!
  jim_leads << jim_lead
end

jim_leads[0..5].each do |lead|
  lead.accepted_at = DateTime.now
  lead.response_time = lead.accepted_at - lead.created_at
  lead.status = "accepted"
  lead.save
end

jim_leads[0..1].each do |lead|
  lead.status = "settled"
  lead.save
end

jim_leads[2..3].each do |lead|
  lead.status = "lost"
  lead.save
end






# user with accepted leads: 2 lost, 2 settled, 2 accepted
chris = User.create(name: "Chris Columb", email: "chris.columb@hotmail.com", password: "123456", photo: "QS_0028.jpg", rank: nil)
chris_leads = []
8.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  chris_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: chris,
  source: "Heavy Equip Inc"
  )
  chris_lead.save!
  chris_leads << chris_lead
end

chris_leads[0..5].each do |lead|
  lead.accepted_at = DateTime.now
  lead.response_time = lead.accepted_at - lead.created_at
  lead.status = "accepted"
  lead.save
end

chris_leads[0..1].each do |lead|
  lead.status = "settled"
  lead.save
end

chris_leads[2..3].each do |lead|
  lead.status = "lost"
  lead.save
end



# user with accepted leads: 2 lost, 2 settled, 2 accepted
nathan = User.create(name: "Nathan Bates", email: "nathan.bates@hotmail.com", password: "123456", photo: "Q_0008.jpg", rank: nil)
nathan_leads = []
8.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  nathan_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: nathan,
  source: "Heavy Equip Inc"
  )
  nathan_lead.save!
  nathan_leads << nathan_lead
end

nathan_leads[0..5].each do |lead|
  lead.accepted_at = DateTime.now
  lead.response_time = lead.accepted_at - lead.created_at
  lead.status = "accepted"
  lead.save
end

nathan_leads[0..1].each do |lead|
  lead.status = "settled"
  lead.save
end

nathan_leads[2..3].each do |lead|
  lead.status = "lost"
  lead.save
end


christopher = User.create(name: "Chris Hutchinson", email: "leadmailertest@gmail.com", password: "123456", photo: "QT_0063.jpg", rank: nil)
2.times do
  lead_name = Faker::Name.name
  email_name = lead_name.gsub!(/\s/, '.')
  christopher_lead = Lead.new(
  name: lead_name,
  email: "#{email_name}@outlook.com",
  phone: Faker::PhoneNumber.cell_phone,
  received_at: Time.now(),
  status: "pending",
  user: christopher,
  source: "Car Kijiji"
  )
  christopher_lead.save!
end

# build the initial lineup
Lineup.build(User.all)


