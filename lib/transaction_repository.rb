class Transaction

  attr_reader :file

  def initialize(file)
    @file = file
    @transaction_parser = TransactionParser.new
    @all = 
  end




end


# 1,1,4654405418249632,,success
# id,invoice_id,credit_card_number,credit_card_expiration_date,result