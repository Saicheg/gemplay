Airbrake.configure do |config|
  config.api_key = 'a3104d7a4234f0b2bee28690ae5ed486'
  config.host    = 'errbit.rubyroidlabs.com'
  config.port    = 80
  config.secure  = config.port == 443
end
