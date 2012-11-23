ActionMailer::Base.smtp_settings = {
  :address              => "hrosi15.gmail.com",
  :port                 => 587,
  :domain               => "sancarborromeo.jimdo.com",
  :user_name            => "hrosi15",
  :password             => "teamopoeta",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?