# frozen_string_literal: true

Clearance.configure do |config|
  config.mailer_sender = "mahmoud@mtantawy.com"
  config.rotate_csrf_on_sign_in = true
  config.allow_sign_up = false
  config.password_strategy = Clearance::PasswordStrategies::Argon2
  config.same_site = :Strict
end
