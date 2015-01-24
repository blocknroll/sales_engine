class Transaction
  
  attr_reader :id, :invoice_id, :cc_number, :cc_expir_date, :result, :created_at, :updated_at

  def initialize(id, invoice_id, cc_number, cc_expir_date, result, created_at, updated_at)
    @id = id
    @invoice_id = invoice_id
    @cc_number = cc_number
    @cc_expir_date = cc_expir_date
    @result = result
    @created_at = created_at
    @updated_at = updated_at
  end

end
