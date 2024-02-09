json.extract! question, :id, :message, :created_at, :updated_at
json.url question_url(question, format: :json)
