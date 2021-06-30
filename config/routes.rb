Rails.application.routes.draw do
  post "/posting", controller: "postings", action: "create"
end
