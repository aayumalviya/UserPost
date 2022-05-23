Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "574710759594-bsqhnru6018ta85bcvt7vuap67u3fn00.apps.googleusercontent.com", "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"
end
OmniAuth.config.allowed_request_methods = %i[get]
