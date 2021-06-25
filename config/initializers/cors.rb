Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://gluci-calc.vercel.app/', 'http://localhost:3000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head], 
      expose: ["Authorization"]
  end
end
