class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status

  def initialize(row)
    @id = row[:id].to_i
    @customer_id = customer_id
    @merchant_id = merchant_id
    @status = status
  end

end
