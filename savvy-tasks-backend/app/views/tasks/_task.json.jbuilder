# frozen_string_literal: true

json.extract! task, :created_at, :updated_at
json.url task_url(task, format: :json)
json.gid task.gid
json.user do
  json.username task.user.username
  json.email task.user.email
end
