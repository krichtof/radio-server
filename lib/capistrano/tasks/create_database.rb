namespace :deploy do
  task :create_database do
    app_name = fetch(:application)
    db_password = fetch(:db_password)
    on roles(:app) do
      execute "sudo -u postgres createuser #{app_name}"
      execute "echo \"ALTER ROLE #{app_name} PASSWORD '#{db_password}';\" | sudo -u postgres psql"
      execute "sudo -u postgres createdb #{app_name} -O #{app_name}"
    end
  end
end