# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

q1 = Question.create(message: "What did you accomplish yesterday?")
q2 = Question.create(message: "What will you work on today?")
q3 = Question.create(message: "Any blockers?")

u1 = User.create(name: "Kyler Matthews", email: "kmatthews791@swehttamrelyk.com")
u2 = User.create(name: "Brandi Sims", email: "bsims726@smisidnarb.biz")
u3 = User.create(name: "Derek Wong", email: "dwong277@gnowkered.org")
u4 = User.create(name: "Amanda Davis", email: "adavis36@sivadadnama.biz")
u5 = User.create(name: "Bill Meeks", email: "bill@example.com", admin: true)


team_a = Team.create(name: "Unity")
team_b = Team.create(name: "Eclipse")
team_c = Team.create(name: "Save Trees")


UserTeam.create(user: u1, team: team_a)
UserTeam.create(user: u2, team: team_a)
UserTeam.create(user: u3, team: team_a)

users = [u1, u2, u3]

[Date.today, Date.today-1, Date.today-2].each do |date|
  Standup.create(team: team_a, date: date)
  users.each do |user|
    Post.create(team: team_a, user: user, standup_date: date, content: Faker::Lorem.paragraph(sentence_count: 3, random_sentences_to_add: 4))
  end
end

