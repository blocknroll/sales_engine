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

  # def items
  #   parent_mr.find_items_using(id)
  # end

end
