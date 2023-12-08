Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"}) 
  get("/users", {:controller => "users", :action => "index"})
  get("/users/:unique_username", {:controller => "users", :action => "show"})
  post("/update_user/:unique_userid", {:controller => "users", :action => "update"})
  post("/add_user", {:controller => "users", :action => "add"})

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:unique_photoid", {:controller => "photos", :action => "show"})
  post("/insert_photo_record", {:controller => "photos", :action => "add"})
  post("/update_photo/:unique_photoid", {:controller => "photos", :action => "update"})
  get("/delete_photo/:unique_photoid", {:controller => "photos", :action => "destroy"})

  post("/add_comment", {:controller => "comments", :action => "add"})
end
