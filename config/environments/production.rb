Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_view.cache_template_loading = true
  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like
  # NGINX, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.paperclip_defaults = { 
    storage: :fog, 
    fog_credentials: { 
      aws_access_key_id: ENV['AWS_PERSEPHONE_ADMISSIONS_APP_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_PERSEPHONE_ADMISSIONS_APP_SECRET_ACCESS_KEY'],
      provider: 'AWS',
      region: 'us-east-1',
      scheme: 'https'
    },
    fog_directory: "persephoneproject3admissions", 
    path: "applications/text_files/:id_partition/:filename"
  }

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :authentication       => :plain,
  :domain               => ENV['GMAIL_SMTP_USER'],
  :user_name            => ENV['GMAIL_SMTP_USER'],
  :password             => ENV['GMAIL_SMTP_PASSWORD']
  }
   
end
# Paperclip::Attachment.default_options[:storage] = :fog
# Paperclip::Attachment.default_options[:fog_credentials] = { 
#   aws_access_key_id: 'AWS_PERSEPHONE_ADMISSIONS_APP_ACCESS_KEY',
#   aws_secret_access_key: 'AWS_PERSEPHONE_ADMISSIONS_APP_SECRET_ACCESS_KEY',
#   provider: 'AWS',
#   region: 'US Standard',
#   scheme: 'https'
# }
# This is the name of the S3 bucket that will store your files.
# Remember that the bucket must be unique across all of Amazon S3.
# If the bucket does not exist, Paperclip will attempt to create it.
# Paperclip::Attachment.default_options[:fog_directory] = "persephoneproject3admissions"
# This is the key under the bucket in which the file will be stored. 
# The URL will be constructed from the bucket and the path. This is what you will want to interpolate.
# Keys should be unique, like filenames, 
# and despite the fact that S3 (strictly speaking) does not support directories,
# you can still use a / to separate parts of your file name.
# Paperclip::Attachment.default_options[:path] = "/applications/text_files/:id_partition/:filename"

