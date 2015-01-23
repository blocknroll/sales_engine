class InvoiceRepository

  attr_reader :file, :all

  def initialize(file)
    @file = file
    @invoice_parser = InvoiceParser.new
    @all = @invoice_parser.make_invoices(file)
  end

  def random
    all.sample
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : "Invoice ID: #{match.id}, Customer ID: #{match.customer_id}, Merchant ID: #{match.merchant_id}"
  end

  def find_by_customer_id(customer_id)
    match = all.detect { |e| e.customer_id == customer_id }
    match.nil? ? "No match, try again." : "Customer ID: #{match.customer_id}, Invoice ID: #{match.id}, Merchant ID: #{match.merchant_id}"
  end

  def find_by_merchant_id(merchant_id)
    match = all.detect { |e| e.merchant_id == merchant_id }
    match.nil? ? "No match, try again." : "Merchant ID: #{match.merchant_id}, Customer ID: #{match.customer_id}, Invoice ID: #{match.id}"
  end

  def find_by_status(status)
    match = all.detect { |e| e.status == status }
    match.nil? ? "No match, try again." : "Status: #{match.status}, Invoice ID: #{match.id}, Customer ID: #{match.customer_id}, Merchant ID: #{match.merchant_id}"
  end

  def find_all_by_merchant_id(merchant_id)
    matches = all.select { |e| e.merchant_id == merchant_id }
    matches.nil? ? [] : matches
  end

  def find_all_by_status(status)
    matches = all.select { |e| e.status == status }
    matches.nil? ? [] : matches
  end

end