module Convection
  mattr_accessor :config
end

Convection.config = OpenStruct.new(
  access_token: ENV['ACCESS_TOKEN'] || 'replace-me',
  admin_email_address: ENV['ADMIN_EMAIL_ADDRESS'] || 'consign@artsy.net',
  contact_phone_number: ENV['CONTACT_PHONE_NUMBER'] || '+1 (646) 712-8154',
  gravity_api_url: "#{ENV['GRAVITY_URL'] || 'https://stagingapi.artsy.net'}/api",
  gravity_app_id: ENV['GRAVITY_APP_ID'] || 'replace-me',
  gravity_app_secret: ENV['GRAVITY_APP_SECRET'] || 'replace-me',
  gravity_xapp_token: ENV['GRAVITY_XAPP_TOKEN'] || 'replace-me',
  gravity_url: ENV['GRAVITY_URL'] || 'https://stagingapi.artsy.net',
  jwt_secret: ENV['JWT_SECRET'] || 'replace-me',
  sidekiq_username: ENV['SIDEKIQ_USERNAME'] || 'admin',
  sidekiq_password: ENV['SIDEKIQ_PASSWORD'] || 'replace-me',
  smtp_address: ENV['SMTP_ADDRESS'],
  smtp_domain: 'artsy.net',
  smtp_password: ENV['SMTP_PASSWORD'],
  smtp_port: ENV['SMTP_PORT'],
  smtp_user: ENV['SMTP_USER']
)