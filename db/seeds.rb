# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts 'Cleaning DB...'

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
  link_slack: "xxx",
  tag_list: "Ruby, Front-end, CSS, JS"
)
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
  description: "Senior freelance developper specialized in backend with years of experience",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/ndgdl",
  link_malt: "xxx",
  link_slack: "xxx",
  tag_list: "Ruby, back-end"
)
nicolas.save

puts 'Creating Alex'
alex = User.new(
  first_name: "Alex",
  last_name: "Vigreux",
  email: "vigreux@test.com",
  password: "password",
  password_confirmation: "password",
  address: "246 rue du Faubourg Saint-Martin, 75010 Paris",
  description: "Senior freelance developper specialized in frontend with years of experience",
  mentor: true,
  xp_level: 100,
  xp_status: "Senior",
  link_github: "https://github.com/Vigrouze",
  link_malt: "xxx",
  link_slack: "xxx"
)
alex.save

puts 'Seeding done:'
puts "#{User.where(mentor: true).count} padawans and #{User.where(mentor: false).count} mentors created"

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
  mentor_id: alex.id,
  status: 1
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
  mentor_id: nicolas.id,
  status: 1
)
mission2.save

puts 'Seeding done:'
puts "#{Mission.all.count} missions created"
