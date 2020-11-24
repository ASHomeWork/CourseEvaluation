json.extract! course, :id, :name, :major_id, :year, :created_at, :updated_at
json.url course_url(course, format: :json)
