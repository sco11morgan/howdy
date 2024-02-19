# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

u1 = User.create!(name: "Kyler Matthews", email: "kmatthews791@swehttamrelyk.com")
u2 = User.create!(name: "Brandi Sims", email: "bsims726@smisidnarb.biz")
u3 = User.create!(name: "Derek Wong", email: "dwong277@gnowkered.org")
u4 = User.create!(name: "Amanda Davis", email: "adavis36@sivadadnama.biz")


team_a = Team.create(name: "Unity")
team_b = Team.create(name: "Eclipse")
team_c = Team.create(name: "Save Trees")