json.extract! response, :id, :session, :view, :answers, :created_at, :updated_at
json.url response_url(response, format: :json)
