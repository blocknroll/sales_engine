require_relative 'invoice_item_parser'

class InvoiceItemRepository

  attr_reader :file, :all, :sales_engine

  def initialize(file, sales_engine)
    @file = file
    @invoice_item_parser = InvoiceItemParser.new
    @all = @invoice_item_parser.make_invoice_item(file, sales_engine)
    @sales_engine = sales_engine
  end

  def random
    all.sample
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_item_id(item_id)
    match = all.detect { |e| e.item_id == item_id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_invoice_id(invoice_id)
    match = all.detect { |e| e.invoice_id == invoice_id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_quantity(quantity)
    match = all.detect { |e| e.quantity == quantity }
    match.nil? ? "No match, try again." : match
  end

  def find_by_unit_price(unit_price)
    match = all.detect { |e| e.unit_price == unit_price }
    match.nil? ? "No match, try again." : match
  end

  def find_all_by_item_id(item_id)
    matches = all.select { |e| e.item_id == item_id }
    matches.nil? ? [] : matches
  end

  def find_all_by_invoice_id(invoice_id)
    matches = all.select { |e| e.invoice_id == invoice_id }
    matches.nil? ? [] : matches
  end

  def find_all_by_quantity(quantity)
    matches = all.select { |e| e.quantity == quantity }
    matches.nil? ? [] : matches
  end

  def find_all_by_unit_price(unit_price)
    matches = all.select { |e| e.unit_price == unit_price }
    matches.nil? ? [] : matches
  end

end
