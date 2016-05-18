require_relative 'common.rb'

class Order
attr_accessor :status, :handling, :item, :size, :color, :option, :comment, :date, :shipper, :arr_track_num, :dep_track_num, :item_id, :qty, :customer_name, :customer_id_num, :customer_address, :customer_id, :shipping, :id, :url, :pre_order_date, :payment_due_date, :first_contact_date, :back_order_date, :coordination_date, :delivery_date, :arrival_date, :rating, :rating_commnet, :report_request, :memo, :profit, :profit_rate, :sales, :stock_date, :purchase_price, :purchase_method, :purchase_date, :supplier, :purchaase_num, :expense_total, :delivery_shipping_cost, :purchase_shipping_cost, :custom_duty, :consumption_tax, :sales_fee, :freebie_fee, :delivery_partner_fee, :other_expenses

  def initialize
    @status = ''
    @handling = ''
    @item = ''
    @size = ''
    @color = ''
    @option = ''
    @comment = ''
    @date = ''
    @shipper = ''
    @arr_track_num = ''
    @dep_track_num = ''
    @item_id = ''
    @qty = ''
    @customer_name = ''
    @customer_id_num = ''
    @customer_address = ''
    @customer_id = ''
    @shipping = ''
    @id = ''
    @url = ''
    @pre_order_date = ''
    @payment_due_date = ''
    @first_contact_date = ''
    @back_order_date = ''
    @coordination_date = ''
    @delivery_date = ''
    @arrival_date = ''
    @rating = ''
    @rating_commnet = ''
    @report_request = ''
    @memo = ''
    @profit = 0
    @profit_rate = 0
    @sales = 0
    @stock_date = ''
    @purchase_price = ''
    @purchase_method = ''
    @purchase_date = ''
    @supplier = ''
    @purchaase_num = ''
    @expense_total = 0
    @delivery_shipping_cost = 0
    @purchase_shipping_cost = 0
    @custom_duty = 0
    @consumption_tax = 0
    @sales_fee = 0
    @freebie_fee = 0
    @delivery_partner_fee = 0
    @other_expenses = 0
  end

  def to_h
    keys = self.instance_variables
    values = self.instance_variables.map{ |key| self.instance_variable_get(key) }

    return Hash[*[keys, values].transpose.flatten]
  end
end
