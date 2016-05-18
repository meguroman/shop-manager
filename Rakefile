require_relative 'common.rb'

desc 'google_docsアクセス'
task :test_gdoc do
  writer = Writer.new
  writer.show
end

task :test_parse do
  html = File.read(File.expand_path('../buyma_kari.html', __FILE__))
  doc = Nokogiri::HTML.parse(html, nil, 'UTF-8')

  parser = Parser.new
  order = parser.order_all(doc)
  pp order.to_h
end

task :test_order do
  order = Order.new
  pp order.to_h
end
