json.extract! user_standup, :id, :team_id, :user_id, :standup_id, :created_at, :updated_at
json.url user_standup_url(user_standup, format: :json)
