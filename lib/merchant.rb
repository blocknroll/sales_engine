class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :parent_mr

  def initialize(data, parent=nil)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @parent_mr  = parent
  end

  # def items
  #   parent_mr.find_items_using(id)
  # end

end
