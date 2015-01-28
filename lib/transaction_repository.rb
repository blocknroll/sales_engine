require_relative 'transaction_parser'

class TransactionRepository

  attr_reader :file, :all, :sales_engine

  def initialize(file, sales_engine)
    @file = file
    @transaction_parser = TransactionParser.new
    @all = @transaction_parser.make_transaction(file)
    @sales_engine = sales_engine
  end

  def random
    all.sample
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_invoice_id(invoice_id)
    match = all.detect { |e| e.invoice_id == invoice_id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_cc_number(cc_number)
    match = all.detect { |e| e.cc_number == cc_number }
    match.nil? ? "No matches, try again." : match
  end

  def find_by_result(result)
    match = all.detect { |e| e.result == result }
    match.nil? ? "No matches, try again." : match
  end

  def find_all_by_invoice_id(invoice_id)
    matches = all.select { |e| e.invoice_id == invoice_id }
    matches.nil? ? [] : matches
  end

  def find_all_by_cc_number(cc_number)
    matches = all.select { |e| e.cc_number == cc_number }
    matches.nil? ? "No matches, try again." : matches
  end

  def find_all_by_result(result)
    matches = all.select { |e| e.result == result }
    matches.nil? ? "No matches, try again." : matches
  end

end


