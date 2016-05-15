require_relative 'common.rb'

class Crawler
  def initialize
    @agent = Mechanize.new
  end

  def login
    account = Account.buyma
    login_page = @agent.get('https://www.buyma.com/login/')
    
    form = login_page.form_with(name: 'formlogin')
    form.txtLoginId = account[:id]
    form.txtLoginPass = account[:password]
    my_page = @agent.submit(form)

    return my_page
  end

  def get_order_page(page)
    order_page = page.link_with(href: 'https://www.buyma.com/my/buyerorders/').click
    return order_page
  end

  def get_order_detail_page(page, order_id)
    regexp = /#{order_id}/
    order_detail_page = page.link_with(href: regexp).click
    return order_detail_page
  end
end
