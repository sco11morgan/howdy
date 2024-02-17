require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /connections" do
    it "returns http success when logged in" do
      team = Team.create!(name: "One Team")
      user = User.create!(name: "admin", admin: true, team: team, email: "admin@example.com", password: "password")
      login_user(user, "password", "/sessions")
      get admin_connections_path
      expect(response).to have_http_status(:success)
    end
  end

end
