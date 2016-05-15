require_relative 'common.rb'

class Site
  def buyma(order_id)
    # 注文IDの取引詳細ページ取得
    crawler = Crawler.new
    my_page = crawler.login
    order_page = crawler.get_order_page(my_page)
    order_detail_page = crawler.get_order_detail_page(order_page, order_id)
    doc = Nokogiri::HTML.parse(order_detail_page.body, nil, 'UTF-8')

    # 注文情報パース
    parser = Parser.new
    #order = parser.order(doc)
  end
end

site = Site.new
site.buyma('7907083')
