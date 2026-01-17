Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
  :google_oauth2,
  ENV["GOOGLE_CLIENT_ID"],
  ENV["GOOGLE_CLIENT_SECRET"],
  {
    scope: "email, profile",
    prompt: "select_account",
    image_aspect_ratio: "square",
    image_size: 50
  })
end
OmniAuth.config.allowed_request_methods = %i[get post]
OmniAuth.config.full_host = Rails.env.production? ? "https://sevendays.com" : "http://localhost:3333"

OmniAuth.config.test_mode = false
OmniAuth.config.allowed_request_methods = [:post, :get]
