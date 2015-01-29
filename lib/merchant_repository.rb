# require_relative 'merchant_parser'

class MerchantRepository

  attr_reader :file, :all, :sales_engine

  def initialize(file=nil, sales_engine)
    @file = file
    @merchant_parser = MerchantParser.new
    @all = @merchant_parser.make_merchant(file, self)
    @sales_engine = sales_engine
  end

  def random
    all.sample
  end

  def find_by_id(id)
    match = all.detect { |e| e.id == id }
    match.nil? ? "No match, try again." : match
  end

  def find_by_name(name)
    match = all.detect { |e| e.name.downcase ==  name.downcase }
    match.nil? ? "No match, try again." : match
  end

  def find_by_created_at(time)
    match = all.detect { |e| e.created_at == time}
    match.nil? ? "No match, try again." : match
  end

  def find_by_updated_at(time)
    match = all.detect { |e| e.updated_at == time}
    match.nil? ? "No match, try again." : match
  end

  # find_all_by_

  def find_all_by_id(id)
    matches = all.select { |e| e.id == id }
    matches.nil? ? [] : matches
  end

  def find_all_by_name(name)
    matches = all.select { |e| e.name.downcase == name.downcase}
    matches.nil? ? [] : matches
  end

  def find_all_by_created_at(created_at)
    matches = all.select { |e| e.created_at == created_at }
    matches.nil? ? [] : matches
  end

  def find_all_by_updated_at(updated_at)
    matches = all.select { |e| e.updated_at == updated_at }
    matches.nil? ? [] : matches
  end

  # RELATIONSHIPS

  def find_items_by(id)
    sales_engine.find_items_by_merchant_id(id)
  end

end
