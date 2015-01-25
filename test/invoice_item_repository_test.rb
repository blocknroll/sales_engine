require_relative 'test_helper'

class InvoiceItemRepositoryTest < Minitest::Test 

attr_reader :invoice_item_repo

  def setup
    @invoice_item_repo = InvoiceItemRepository.new("text/fixtures/invoice_items_fixtures.csv")
  end

  def test_it_exists
    assert invoice_item_repo
  end

  def test_it_reads_all_inventory_items
    assert_equal 10, invoice_item_repo.all.count
  end



end