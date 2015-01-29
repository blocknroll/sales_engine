class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :merchant_repo

  def initialize(data, merchant_repo=nil)
    @id             = data[:id]
    @name           = data[:name]
    @created_at     = data[:created_at]
    @updated_at     = data[:updated_at]
    @merchant_repo  = merchant_repo
  end

  def items
    merchant_repo.find_items_by(id)
  end

  def invoices
    merchant_repo.find_invoices_by(id)
  end

end
