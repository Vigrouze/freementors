# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

puts 'Cleaning DB...'

Relationship.destroy_all
Mission.destroy_all
User.destroy_all

puts 'Cleaning done'

puts 'Seeding padawans...'

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
  xp_level: 25,
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
  tag_list: "CSS, HTML, Javascript, Ruby, React"
)
file = URI.open('https://avatars.githubusercontent.com/u/25386941?v=4')
germain.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
germain.save

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
  tag_list: "CSS, HTML, Javascript, Ruby, React"
)
file = URI.open('https://avatars.githubusercontent.com/u/54894352?v=4')
nadia.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
nadia.save

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
  link_malt: "#",
  link_slack: "https://lewagon-alumni.slack.com/app_redirect?channel=U4XK1JBAB",
  tag_list: "CSS, HTML, Javascript"
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
  tag_list: "Ruby, Python, C"
)
file = URI.open('https://avatars.githubusercontent.com/u/30435844?v=4')
thibaud.avatar.attach(io: file, filename: 'nes.png', content_type: 'image/png')
thibaud.save

puts 'Creating fakkers'
50.times do
  last_name = Faker::Name.last_name
  faker = User.new(
    first_name: Faker::Name.first_name,
    last_name: last_name,
    email: "#{last_name}@test.com",
    password: "password",
    password_confirmation: "password",
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: Faker::Lorem.paragraphs(number: 1).join,
    mentor: true,
    xp_level: 100,
    xp_status: "Senior",
    link_github: "https://github.com/#{last_name}",
    link_malt: "xxx",
    link_slack: "xxx",
    tag_list: User::SKILLS[:frontend].sample(2) + User::SKILLS[:backend].sample(2)
  )
  faker.save
end

puts 'Seeding done:'
puts "#{User.where(mentor: false).count} padawans and #{User.where(mentor: true).count} mentors created"

puts 'Sending missions'
mission1 = Mission.new(
  name: "Développeur(se) Front-End",
  company: "Swile",
  start_date: "2022-01-07",
  end_date: "2022-07-04",
  description: "
   Concevoir et développer sur des techniques de Front,
   Réalisation de tests unitaires et fonctionnels,
   Déployer l’environnement recette,
   Rédaction de la documentation,
   Participer aux revues de code,
    Vous avez des compétences techniques clefs : HTML 5, Java Script, CSS3, Ruby on Rails",
  fee: 500,
  remote: true,
  mentor_id: py.id,
  padawan_id: alex.id,
  status: 2
)
mission1.save

puts 'Sending missions'
mission2 = Mission.new(
  name: "Développeur(se) Back-End",
  company: "Lydia",
  start_date: "2022-01-02",
  end_date: "2022-06-06",
  description: "
  Gérer le déploiement de la V3 de notre solution côté backend
  Gérer l'architecture et les migrations de data si nécessaire
  Ouvrir de nouvelles routes sur notre API + intégrations d'APIs tierces (DataTourisme par ex.)
  Mise en place d’un process de déploiement continu (tests E2E)
  Optimisation du code existant (refacto, bugfixing etc.)",
  fee: 600,
  remote: true,
  mentor_id: thibaud.id,
  status: 0
)
mission2.save

mission3 = Mission.new(
  name: "Back-End dev",
  company: "Le Wagon",
  start_date: "2022-01-02",
  end_date: "2022-06-06",
  description: "
  Improve the roulette",
  fee: 200,
  remote: true,
  mentor_id: py.id,
  padawan_id: alex.id,
  status: 2
)
mission3.save!

review = Review.new(
  content: "Pierre-Yves was a great mentors with lot of support and advices to improve my code. The mission was good for a beginner and enjoy to apply what I learned",
  reviewer_id: alex.id,
  reviewee_id: py.id,
  mission_id: mission1.id,
  rating: 5
)
review.save!
puts "review saved"

puts 'Sending faker missions'
30.times do
  start_date = Faker::Date.between(from: '2021-11-23', to: '2022-04-25')
  faker_mission = Mission.new(
    name: "Développeur(se) Back-End",
    company: Faker::Company.name,
    start_date: start_date,
    end_date: Faker::Date.between(from: start_date, to: '2022-04-25'),
    description: Faker::Lorem.paragraphs(number: 1).join,
    fee: rand(200..1000),
    remote: true,
    mentor_id: rand((User.mentor.first.id)..(User.mentor.last.id)),
    status: 0
  )
  faker_mission.save

  relation = Relationship.new(
    padawan_id: alex.id,
    mentor_id: py.id,
    status: 1
  )
  relation.save
end

puts 'Seeding done:'
puts "#{User.all.count} users created"
puts "#{Mission.all.count} missions created"
puts "#{Relationship.all.count} relation created"
