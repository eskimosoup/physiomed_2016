namespace :ping_host do
  task :request do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'ping_host:request'
        end
      end
    end
  end
end

after 'deploy:log_revision', 'ping_host:request'
