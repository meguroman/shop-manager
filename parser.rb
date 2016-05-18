require_relative 'common.rb'

class Parser
  def order_all(doc)
    order = Order.new

    order.status = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(1) > td > div > p:nth-child(1)').text.strip.gsub(/[【】]/,'') #受注状況
    order.handling = order.status == '受注' ? '出荷準備中' : '入金待ち' #対応状況 
    order.item = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(3) > td').text.strip.split('（')[0] #商品名
    order.size = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(18) > td').text.strip #サイズ
    order.color = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(18) > td').text.strip #カラー
    order.option = '' #オプション
    order.comment = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(18) > td').text.strip #顧客要望
    order.date = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(14) > td').text.strip #販売日
    order.shipper = '西本さん' #発送担当
    order.arr_track_num = '' #入荷追跡No.
    order.dep_track_num = '' #発送追跡No.
    order.item_id = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(3) > td').text.strip.split('：')[1].delete('）') #商品ID
    order.qty = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(12) > td').text.strip.delete('個') #数量
    order.customer_name = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(5) > td').text.strip #購入者
    order.customer_id_num = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(4) > td').text.strip.split('：')[1].delete('）') #購入者ID
    order.customer_address = order.status == '受注' ? doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(9) > td > dl:nth-child(1) > dd').text.strip.gsub(/\n\t*/,' ') : '' #住所
    order.customer_id = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(4) > td').text.strip.split('（')[0] #ID名称
    order.shipping = 'クロネコDM便' #発送方法
    order.id = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(2) > td').text.strip #取引ID
    order.url = 'https://www.buyma.com/my/buyerorderdetail/?tid=' + order.id #URL
    order.pre_order_date = order.status == '受注' ? '-' : '未連絡'#仮受注連絡
    order.payment_due_date = order.status == '受注' ? '-' : doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(17) > td').text.strip #入金期限
    order.first_contact_date = order.status == '受注' ? '未連絡' : '' #初回連絡
    order.back_order_date = '' #取寄日数
    order.coordination_date = '' #調整
    order.delivery_date = '' #発送連絡
    order.arrival_date = '' #到着通知
    order.rating = '' #評価
    order.rating_commnet = '' #評価コメント
    order.report_request = '' #着レポ依頼
    order.memo = '' #特記事項
    order.profit = 0 #利益
    order.profit_rate = 0 #利益率(%)
    order.sales = doc.css('#content > form > div > div > table:nth-child(6) > tbody > tr:nth-child(11) > td').text.strip.split('商品価格')[1].split('円')[0] #売上価格
    order.stock_date = '' #仕入れ日
    order.purchase_price = '' #購入価格
    order.purchase_method = '' #カード
    order.purchase_date = '' #支払日
    order.supplier = '' #購入先
    order.purchaase_num = '' #発注No.
    order.expense_total = 0 #経費合計
    order.delivery_shipping_cost = 0 #顧客宛送料
    order.purchase_shipping_cost = 0 #仕入送料
    order.custom_duty = 0 #関税
    order.consumption_tax = 0 #消費税
    order.sales_fee = 0 #販売手数料
    order.freebie_fee = 0 #オマケ
    order.delivery_partner_fee = 0 #発送代行手数料
    order.other_expenses = 0 #その他

    return order
  end
end
