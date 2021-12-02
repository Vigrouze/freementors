# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'open-uri'
require 'faker'

puts 'Cleaning DB...'

Relationship.destroy_all
Mission.destroy_all
Notification.destroy_all
Chatroom.destroy_all
Message.destroy_all
User.destroy_all

puts 'Cleaning done'

puts 'Seeding padawans...'
mentors = []
puts 'Creating Alexandre'
alexandre = User.new(
  first_name: "Alexandre",
  last_name: "Havard",
  address: "33 Rue de Strasbourg, 92110 CLICHY",
  email: "havard@test.com",
  password: "password",
  password_confirmation: "password",
  language: "French, English",
  description: "Young freelance developper looking for his first freelance mission",
  mentor: false,
  xp_level: 0,
  xp_status: "Junior",
  link_github: "https://github.com/alhd7892",
  link_malt: "xxx",
  link_slack: "xxx"
)
file = URI.open('https://avatars.githubusercontent.com/u/87811770?v=4')
alexandre.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
alexandre.save

puts 'Creating Jeremy'
jeremy = User.new(
  first_name: "Jeremy",
  last_name: "Blondeau",
  address: "Place d'Armes, 78000 Versailles",
  email: "blondeau@test.com",
  password: "password",
  password_confirmation: "password",
  language: "French, Breton",
  description: "Young freelance developper looking for his first freelance mission",
  mentor: false,
  xp_level: 0,
  xp_status: "Junior",
  link_github: "https://github.com/Joelebucheron",
  link_malt: "xxx",
  link_slack: "xxx"
)
file = URI.open('https://avatars.githubusercontent.com/u/86318433?v=4')
jeremy.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
jeremy.save

puts 'Seeding mentors...'

puts 'Creating Nicolas'
nicolas = User.new(
  first_name: "Nicolas",
  last_name: "de Guilhem",
  address: "65 Rue Antoine Marie Colin, 94400 Vitry-sur-Seine",
  email: "deguilhem@test.com",
  password: "password",
  password_confirmation: "password",
  language: "French, English",
  description: "Junior freelance developper with serveral experiences in front, alumni @LeWagonParis",
  mentor: false,
  xp_level: 25,
  xp_status: "Padawan",
  link_github: "https://github.com/ndgdl",
  link_malt: "xxx",
  link_slack: "xxx",
  tag_list: "Ruby, Java, HTML, CSS"
)
file = URI.open('https://avatars.githubusercontent.com/u/88536137?v=4')
nicolas.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
nicolas.save

puts 'Creating Alex'
alex = User.new(
  first_name: "Alex",
  last_name: "Vigreux",
  email: "vigreux@test.com",
  password: "password",
  password_confirmation: "password",
  address: "246 rue du Faubourg Saint-Martin, 75010 Paris",
  description: "Young freelance developper, several experiences in frontend, alumni @LeWagonParis",
  mentor: false,
  xp_level: 20,
  xp_status: "Padawan",
  link_github: "https://github.com/Vigrouze",
  link_malt: "xxx",
  link_slack: "xxx",
  tag_list: "CSS, HTML"
)
file = URI.open('https://avatars.githubusercontent.com/u/87474835?v=4')
alex.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
alex.save

puts 'Creating Germain'
germain = User.new(
  first_name: "Germain",
  last_name: "Loret",
  email: "loret@test.com",
  password: "password",
  password_confirmation: "password",
  address: "27 Rue d'Argenteuil, Paris",
  description: "I was Marketing Manager for 3 years at GSM55.com. I learn to code to be abble to make my own projects. After the Wagon, I want to continue to code, on my projects or on any cool projects.",
  mentor: true,
  xp_level: 100,
  xp_status: "Mentor",
  link_github: "https://github.com/grmnlrt",
  link_malt: "xxx",
  link_slack: "xxx",
  tag_list: "CSS, HTML, JavaScript, Ruby, React",
  rating: 5,
)
file = URI.open('https://avatars.githubusercontent.com/u/25386941?v=4')
germain.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
germain.save
mentors << germain

puts 'Creating Nadia'
nadia = User.new(
  first_name: "Nadia",
  last_name: "Auger",
  email: "auger@test.com",
  password: "password",
  password_confirmation: "password",
  address: "49 Rue de Varenne, Paris",
  description: "After being graduated from an engineering school I worked in an Investment Bank in New York during two years. I always wanted to work as a freelancer this is why I attempted Le Wagon Paris.",
  mentor: true,
  xp_level: 100,
  xp_status: "Mentor",
  link_github: "https://github.com/nadiaauger",
  link_malt: "xxx",
  link_slack: "xxx",
  tag_list: "CSS, HTML, JavaScript, Ruby, React",
  rating: 4,
)
file = URI.open('https://avatars.githubusercontent.com/u/54894352?v=4')
nadia.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
nadia.save
mentors << nadia

puts 'Creating PY'
py = User.new(
  first_name: "Pierre-Yves",
  last_name: "Le Guennec",
  email: "py@test.com",
  password: "password",
  password_confirmation: "password",
  address: "14 Rue Crespin du Gast, 75011 Paris",
  description: "Frontend expert with years of experience, teacher @LeWagonParis",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/pyveslg",
  link_malt: "https://www.linkedin.com/in/pierre-yvesleguennec/",
  link_slack: "https://lewagon-alumni.slack.com/app_redirect?channel=U4XK1JBAB",
  tag_list: "CSS, HTML, JavaScript",
  rating: 5,
)
file = URI.open('https://avatars.githubusercontent.com/u/8135012?v=4')
py.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
py.save

puts 'Creating thibaud'
thibaud = User.new(
  first_name: "Thibaud",
  last_name: "Maurel",
  email: "maurel@test.com",
  password: "password",
  password_confirmation: "password",
  address: "16 Vla Gaudelet, 75011 Paris",
  description: "Working as freelancer since 2019, teacher @LeWagonParis. Former student in engineer school and working in bank sector",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/thmaurel",
  link_malt: "https://www.linkedin.com/in/thibaudmaurel/",
  link_slack: "https://lewagon-alumni.slack.com/app_redirect?channel=UHSMW24EA",
  tag_list: "Ruby, Python, C",
  rating: 5,
)
file = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQHrnRgo3R0TqA/profile-displayphoto-shrink_800_800/0/1602858443559?e=1643846400&v=beta&t=6su5SUQBjQeah24qw-RcJ5dLZni1qfPxwUQsyeKZYJ8')
thibaud.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
thibaud.save

victor2 = User.new(
  first_name: "Victor",
  last_name: "Holl",
  email: "holl@test.com",
  password: "password",
  password_confirmation: "password",
  address: "Paris",
  description: "I travelled the world to find the best surf spots, after saving babies seals and swin with white shark I decided to learn code to make website to share my experience.",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/v-h-z",
  link_malt: "",
  link_slack: "",
  tag_list: "Ruby, Python, CSS, HTML",
  rating: 5,
)
file = URI.open('https://avatars.githubusercontent.com/u/62886862?v=4')
victor2.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
victor2.save

puts 'Creating matthieu'
matthieu = User.new(
  first_name: "Matthieu",
  last_name: "Minier",
  email: "minier@test.com",
  password: "password",
  password_confirmation: "password",
  address: "Paris",
  description: "Hi! I'm Matthieu, from Paris. After working in HR Communications and Marketing, I worked one year in Indonesia towards the social & professional integration of excluded young adults",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/Mafiews",
  link_malt: "#",
  link_slack: "#",
  tag_list: "Java, Ruby, Python",
  rating: 4,
)
file = URI.open('https://avatars.githubusercontent.com/u/62572114?v=4')
matthieu.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
matthieu.save
mentors << matthieu

puts 'Creating thanh'
thanh = User.new(
  first_name: "Thanh",
  last_name: "Tran",
  email: "tran@test.com",
  password: "password",
  password_confirmation: "password",
  address: "Paris",
  description: "I enjoy every aspect of programming, whether front or back. :) Hopefully I'll be able to help you on both",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/trandthanh",
  link_malt: "#",
  link_slack: "#",
  tag_list: "Java, Ruby, Python",
  rating: 4,
)
file = URI.open('https://avatars.githubusercontent.com/u/25582652?v=4')
thanh.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
thanh.save
mentors << thanh

puts 'Creating Victor'
victor = User.new(
  first_name: "Victor",
  last_name: "Branger",
  email: "tran@test.com",
  password: "password",
  password_confirmation: "password",
  address: "Paris",
  description: "For 5 years, I worked for a TV series festival and I was in charge of the professional arm of the event. I had a great time working on digital projects and that's why I want to learn to code.",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/vbranger",
  link_malt: "#",
  link_slack: "#",
  tag_list: "CSS, JavaScript, React, HTML",
  rating: 5,
)
file = URI.open('https://avatars.githubusercontent.com/u/25443871?v=4')
victor.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
victor.save
mentors << victor

puts 'Creating Sunny'
sunny = User.new(
  first_name: "Sunny",
  last_name: "Ripert",
  email: "ripert@test.com",
  password: "password",
  password_confirmation: "password",
  address: "Paris",
  description: "Web developer, mentor, teacher, and speaker. Previously at KissKissBankBank, now working with the 3D printing models marketplace Cults. Loving theater improv and code.",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/sunny",
  link_malt: "#",
  link_slack: "#",
  tag_list: "CSS, JavaScript, React, HTML",
  rating: 4,
)
file = URI.open('https://avatars.githubusercontent.com/u/132?v=4')
sunny.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
sunny.save
mentors << sunny

puts 'Creating Hugo'
hugo = User.new(
  first_name: "Hugo",
  last_name: "Mancini",
  email: "mancini@test.com",
  password: "password",
  password_confirmation: "password",
  address: "Paris",
  description: "I worked for two years in a startup as business analyst and then as business developper",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/pur100",
  link_malt: "#",
  link_slack: "#",
  tag_list: "CSS, HTML, Ruby",
  rating: 4,
)
file = URI.open('https://avatars.githubusercontent.com/u/52654117?v=4')
hugo.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
hugo.save
mentors << hugo

puts 'Creating Martial'
martial = User.new(
  first_name: "Martial",
  last_name: "salgues",
  email: "salgues@test.com",
  password: "password",
  password_confirmation: "password",
  address: "Paris",
  description: "After 7 years as a b2b sales representative, I was thrilled to take a new challenge and embrace what I always loved to do, coding.",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/mar7ius",
  link_malt: "#",
  link_slack: "#",
  tag_list: "CSS, HTML, Ruby",
  rating: 5
)
file = URI.open('https://avatars.githubusercontent.com/u/10807969?v=4')
martial.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
martial.save
# mentors << martial

puts(mentors.count + 2)

############################ MENTORS' MISSION CREATION EXCEPT PY & THIBAUD #############
mentors.each do |mentor|
  rand(1..5).times do
    start_date = Faker::Date.between(from: '2021-11-23', to: '2022-04-25')
    faker_mission = Mission.new(
      name: "Développeur(se) Back-End",
      company: Faker::Company.name,
      start_date: start_date,
      end_date: Faker::Date.between(from: start_date, to: '2022-04-25'),
      description: Faker::Lorem.paragraphs(number: 1).join,
      fee: rand(200..1000),
      remote: true,
      mentor_id: mentor.id,
      status: 0
    )
    faker_mission.save
  end
end

###################################################################################


# puts 'Creating fakkers'
# 50.times do
#   last_name = Faker::Name.last_name
#   faker = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: last_name,
#     email: "#{last_name}@test.com",
#     password: "password",
#     password_confirmation: "password",
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     description: Faker::Lorem.paragraphs(number: 1).join,
#     mentor: true,
#     xp_level: 100,
#     xp_status: "Senior",
#     link_github: "https://github.com/#{last_name}",
#     link_malt: "xxx",
#     link_slack: "xxx",
#     tag_list: User::SKILLS[:frontend].sample(2) + User::SKILLS[:backend].sample(2),
#     rating: rand(3..4)
#   )
#   faker.save
#   rand(3..10).times do
#     start_date = Faker::Date.between(from: '2021-11-23', to: '2022-04-25')
#     faker_mission = Mission.new(
#       name: "Développeur(se) Back-End",
#       company: Faker::Company.name,
#       start_date: start_date,
#       end_date: Faker::Date.between(from: start_date, to: '2022-04-25'),
#       description: Faker::Lorem.paragraphs(number: 1).join,
#       fee: rand(200..1000),
#       remote: true,
#       mentor_id: faker.id,
#       status: 0
#     )
#     faker_mission.save
#   end
# end

puts 'Seeding done:'
puts "#{User.where(mentor: false).count} padawans and #{User.where(mentor: true).count} mentors created"

puts 'Sending missions'
mission1 = Mission.new(
  name: "Front-end dev",
  company: "Swile",
  start_date: "2022-01-07",
  end_date: "2022-07-04",
  description: "
   Designing and developing on front-end techniques,
   Performing unit and functional tests,
   Deploying the acceptance environment,
   Writing documentation,
   Participating in code reviews,
  You have key technical skills: HTML 5, CSS3",
  fee: 500,
  remote: true,
  mentor_id: py.id,
  padawan_id: alex.id,
  status: 2,
  tag_list: "CSS, HTML"
)
mission1.save

puts 'Sending missions'
mission2 = Mission.new(
  name: "Back-End developer",
  company: "Lydia",
  start_date: "2022-01-02",
  end_date: "2022-06-06",
  description: "
  Manage the deployment of V3 of our solution on the backend
  Manage the architecture and data migrations if necessary
  Open new routes on our API + integrate third party APIs (e.g. DataTourism)
  Implementation of a continuous deployment process (E2E tests)
  Optimisation of existing code (refactoring, bugfixing etc.)",
  fee: 600,
  remote: true,
  mentor_id: thibaud.id,
  status: 0,
  tag_list: "Ruby"
)
mission2.save

mission3 = Mission.new(
  name: "Fullstack dev",
  company: "Le Wagon Paris",
  start_date: "2022-01-02",
  end_date: "2022-06-06",
  description: "
  Create an web application to count the points during the 'Wag-Olympiades'.
  We have different challenge and referees need an application to count the points per team,
  set the timers and assign the different teams to events",
  fee: 450,
  remote: true,
  mentor_id: py.id,
  padawan_id: alex.id,
  status: 2,
  tag_list: "Ruby, CSS, HTML"
)
mission3.save!

review = Review.new(
  content: "Pierre-Yves was a great mentors with lot of support and advices to improve my code.
  The mission was good for a beginner and enjoy to apply what I learned",
  reviewer_id: alex.id,
  reviewee_id: py.id,
  mission_id: mission1.id,
  rating: 5
)
review.save!
puts "review saved"

# puts 'Sending faker missions'
# 300.times do
#   start_date = Faker::Date.between(from: '2021-11-23', to: '2022-04-25')
#   faker_mission = Mission.new(
#     name: "Développeur(se) Back-End",
#     company: Faker::Company.name,
#     start_date: start_date,
#     end_date: Faker::Date.between(from: start_date, to: '2022-04-25'),
#     description: Faker::Lorem.paragraphs(number: 1).join,
#     fee: rand(200..1000),
#     remote: true,
#     mentor_id: rand((User.mentor.first.id)..(User.mentor.last.id)),
#     status: 0
#   )
#   faker_mission.save
#   end
relation = Relationship.new(
  padawan_id: alex.id,
  mentor_id: py.id,
  status: 1
)
relation.save

Relationship.create(
  padawan_id: jeremy.id,
  mentor_id: py.id
)

mission4 = Mission.new(
  name: "Back-End developer",
  company: "BNP",
  start_date: "2022-03-12",
  end_date: "2022-04-06",
  description: "
    Package and operationalize algorithms and internal tools.
    Create demonstrators for AI functional testing purposes
    Contribute to and/or ensure the support of operational entities on the operational implementation of Data
    and AI use cases on Big Data and Cloud platforms",
  fee: 500,
  remote: true,
  mentor_id: thibaud.id,
  status: 0,
  tag_list: "Ruby, Python"
)
mission4.save

puts 'Seeding done:'
puts "#{User.all.count} users created"
puts "#{Mission.all.count} missions created"
puts "#{Relationship.all.count} relation created"
