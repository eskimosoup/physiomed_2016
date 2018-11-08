# Setup

`rake db:reset db:seed`

 
bundle exec rake pg_search:multisearch:rebuild[Article] RAILS_ENV=staging
bundle exec rake pg_search:multisearch:rebuild[LandingPage] RAILS_ENV=staging
bundle exec rake pg_search:multisearch:rebuild[Page] RAILS_ENV=staging
bundle exec rake pg_search:multisearch:rebuild[Service] RAILS_ENV=staging
