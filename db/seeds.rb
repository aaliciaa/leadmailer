# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Lead.destroy_all

alicia = User.create(name: "Alicia Bolton", email: "alicia.bolton@hotmail.com", password: "123456", photo: "http://placehold.it/350x350", rank: 2)

  1.times do
    lead_name = "Biz Metzler"
    lead = Lead.new(
      name: lead_name,
      email: Faker::Internet.email(lead_name),
      received_at: Time.now(),
      status: "pending",
      user: alicia,
      source: ["Car Kijiji", "Truck Sales", "Alibaba"].sample,
      )
    lead.save!
  end

10.times do
  name = Faker::Name.name
  new_user = User.new(
    name: name,
    email: Faker::Internet.email(name),
    password: "password",
    photo: "http://placehold.it/350x350",
    rank: 1
    )
  new_user.save!
  puts "User created!"
  5.times do
    lead_name = Faker::Name.name
    lead = Lead.new(
      name: lead_name,
      email: Faker::Internet.email(lead_name),
      received_at: Time.now(),
      status: "pending",
      user: new_user,
      source: ["Car Kijiji", "Truck Sales", "Alibaba"].sample
      )
    lead.save!
  end
  puts "lead created!"

  accepted_leads = []

  20.times do
    lead = Lead.all.sample
    lead.accepted_at = DateTime.now
    lead.response_time = lead.accepted_at - lead.created_at
    lead.status = "accepted"
    lead.save
    accepted_leads << lead
  end

  10.times do
    lead = accepted_leads.sample
    lead.status = "settled"
    lead.save
  end

  10.times do
    lead = accepted_leads.sample
    lead.status = "lost"
    lead.save
  end
end

