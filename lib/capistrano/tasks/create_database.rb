namespace :deploy do
  task :create_database do
    app_name = fetch(:full_app_name)
    execute "sudo -u postgres createdb #{app_name}"
  end
end