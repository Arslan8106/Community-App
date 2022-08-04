json.extract! article, :id, :title, :description, :membership_id, :group_id, :created_at, :updated_at
json.url article_url(article, format: :json)
