class Customer

  attr_reader :customer_id, :first_name, :last_name, :created_at, :updated_at

  def initialize(first_name)
    # @customer_id = customer_id
    @first_name = first_name
    # @last_name = last_name
  end

end


# class Merchant
#   attr_reader :id, :name
#
#   def initialize(my_data, my_parent)
#     @id = my_data[:id].to_i
#     @name = my_data[:name]
#     @parent = my_parent
#   end
#
#   def invoices
#     @parent.find_invoices_by_merchant_id(id)
#   end
# end
