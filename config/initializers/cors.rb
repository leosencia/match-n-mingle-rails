Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # You can specify the domains you want to allow or use '*' to allow all domains

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
