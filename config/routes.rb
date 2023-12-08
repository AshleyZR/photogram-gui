Rails.application.routes.draw do
  get("/", {:controller => "users", action => "index"}) 
  get("/users", {:controller => "users", action => "index"})
  get("/users/:unique_username", {:controller => "users", action => "show"})
  get("/users/add_user", {:controller => "users", action => "add")
  get("/photos", {:controller => "photos", action => "index"})
end
