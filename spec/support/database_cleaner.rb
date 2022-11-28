require 'database_cleaner-sequel'

Hanami.app.prepare(:persistence)
DatabaseCleaner[:sequel, db: Hanami.app['persistence.db']]
DatabaseCleaner.allow_remote_database_url = Hanami.app['settings'].database_url

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each, type: :database) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
