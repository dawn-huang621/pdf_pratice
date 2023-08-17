# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.default_options[:quiet] = false
  config.wkhtmltopdf = '/home/root0604/.rvm/gems/ruby-3.2.2/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost"
  config.verbose = false
end