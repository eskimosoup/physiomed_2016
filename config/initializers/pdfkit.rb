PDFKit.configure do |config|
  config.wkhtmltopdf = if Rails.env.production?
                         '/usr/local/bin/wkhtmltopdf'
                       else
                         '/usr/local/bin/wkhtmltopdf'
                       end
end
