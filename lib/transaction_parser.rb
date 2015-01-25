require 'csv'
require_relative 'transaction'

class TransactionParser

  def make_transaction(file)
    contents = CSV.open(file, headers: true, header_converters: :symbol)
    parse(contents)
  end
  
  private
  def parse(contents)
    contents.map { |row| Transaction.new({
      :id             => row[:id],
      :invoice_id     => row[:invoice_id],
      :cc_number      => row[:credit_card_number],
      :cc_expir_date  => row[:credit_card_expiration_date],
      :result         => row[:result],
      :created_at     => row[:created_at],
      :updated_at     => row[:updated_at]
      } ) }
  end

end