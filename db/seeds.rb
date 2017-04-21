

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
  lead = Lead.new(
    name: lead_name,
    email: "#{lead_name}@outlook.com",
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
  nicole_lead = Lead.new(
  name: lead_name,
  email: "#{lead_name}@outlook.com",
  received_at: Time.now(),
  status: "pending",
  user: nicole,
  source: "Heavy Equip Inc"
  )
  nicole_lead.save!
end

# user with accepted leads: 2 lost, 2 settled, 2 accepted
christie = User.create(name: "Christie Clark", email: "christie.clark@hotmail.com", password: "123456", photo: "QS_0123.jpg", rank: nil)
christie_leads = []
8.times do
  lead_name = Faker::Name.name
  christie_lead = Lead.new(
  name: lead_name,
  email: "#{lead_name}@outlook.com",
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




