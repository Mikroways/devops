namespace :deploy do
  desc 'Notify service of deployment'
  task :notify do
    run_locally do
        execute "open -a Safari http://#{roles(:app).first.hostname}"
    end
  end

  after :finished, :notify
end
