require 'csv'
require_relative 'transaction'

class TransactionParser

  def make_transaction(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents)
  end
  
  private
  def parse(contents)
    contents.map { |row| Transaction.new(
      row[:id],
      row[:invoice_id],
      row[:credit_card_number],
      row[:credit_card_expiration_date],
      row[:result],
      row[:created_at],
      row[:updated_at]
      ) }
  end

end