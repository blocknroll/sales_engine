# require_relative 'item_parser'

class ItemRepository

  attr_reader :file, :all

  def initialize(file)
    @file = file
    @item_parser = ItemParser.new
    @all = @item_parser.make_items(@file)
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

  def find_by_description(description)
    match = all.detect { |e| e.description.downcase == description.downcase}
    match.nil? ? "No match, try again." : match
  end

  def find_by_unit_price(price)
    match = all.detect { |e| e.unit_price == price}
    match.nil? ? "No match, try again." : match
  end

  def find_by_merchant_id(id)
    match = all.detect { |e| e.merchant_id == id}
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

  def find_all_by_description(description)
    matches = all.select { |e| e.description == description }
    matches.nil? ? [] : matches
  end

  def find_all_by_unit_price(unit_price)
    matches = all.select { |e| e.unit_price == unit_price }
    matches.nil? ? [] : matches
  end

  def find_all_by_merchant_id(merchant_id)
    matches = all.select { |e| e.merchant_id == merchant_id }
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

end
