require_relative 'invoice_parser'

class InvoiceRepository

  attr_reader :file, :all, :sales_engine

  def initialize(file, sales_engine)
    @file = file
    @invoice_parser = InvoiceParser.new
    @all = @invoice_parser.make_invoice(file, sales_engine)
    @sales_engine = sales_engine
  end

  def random
    all.sample
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_customer_id(customer_id)
    match = all.detect { |e| e.customer_id == customer_id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_merchant_id(merchant_id)
    match = all.detect { |e| e.merchant_id == merchant_id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_status(status)
    match = all.detect { |e| e.status == status }
    match.nil? ? "No match, try again." : match
  end

  def find_all_by_customer_id(customer_id)
    matches = all.select { |e| e.customer_id == customer_id }
    matches.nil? ? [] : matches
  end

  def find_all_by_merchant_id(merchant_id)
    matches = all.select { |e| e.merchant_id == merchant_id }
    matches.nil? ? [] : matches
  end

  def find_all_by_status(status)
    matches = all.select { |e| e.status == status }
    matches.nil? ? [] : matches
  end

  def find_transactions_by_invoice_id
    sales_engine.find_transactions_by_id(id)
  end

  def find_items_by_invoice_id(id)
    sales_engine.find_items_by_invoice_id(id)
  #go to invoice_items and find all by item id
  end

  def find_by_customer_id(id)
    sales_engine.find_by_customer_id(id)
  end

  def find_by_merchant_id(id)
    sales_engine.find_by_merchant_id(id)
  end

end
