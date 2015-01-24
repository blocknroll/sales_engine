require_relative 'transaction_parser'

class TransactionRepository

  attr_reader :file, :all

  def initialize(file)
    @file = file
    @transaction_parser = TransactionParser.new
    @all = @transaction_parser.make_transaction(file)
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

  def find_by_cc_number
    
  end

end


