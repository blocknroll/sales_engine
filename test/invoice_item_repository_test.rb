require_relative 'test_helper'

class InvoiceItemRepositoryTest < Minitest::Test 

attr_reader :invoice_item_repo

  def setup
    @invoice_item_repo = InvoiceItemRepository.new("test/fixtures/invoice_items_fixtures.csv", self)
  end

  def test_it_exists
    assert invoice_item_repo
  end

  def test_it_reads_all_instances
    assert_equal 10, invoice_item_repo.all.count
  end

  def test_it_returns_a_random_instance
    test = []
    100.times { test << invoice_item_repo.random }
    test = test.uniq 
    assert test.count > 1
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "1", invoice_item_repo.find_by_id("1").id
  end

  def test_it_returns_a_find_by_item_id_match
    assert_equal "539", invoice_item_repo.find_by_item_id("539").item_id
  end

  def test_it_returns_a_find_by_invoice_id_match
    assert_equal "1", invoice_item_repo.find_by_invoice_id("1").invoice_id
  end

  def test_it_returns_a_find_by_quantity_match
    assert_equal "5", invoice_item_repo.find_by_quantity("5").quantity
  end

  def test_it_returns_a_find_by_unit_price_match
    assert_equal "13635", invoice_item_repo.find_by_unit_price("13635").unit_price
  end

  def test_it_returns_a_find_all_by_id_match
    # Because this value is unique, should we create a method that does this job?
  end

  def test_it_returns_a_find_all_by_item_id_match
    assert_equal 1, invoice_item_repo.find_all_by_item_id("539").count
  end

  def test_it_returns_a_find_all_by_invoice_id_match
    assert_equal 8, invoice_item_repo.find_all_by_invoice_id("1").count
  end

  def test_it_returns_a_find_all_by_quantity_match
    assert_equal 2, invoice_item_repo.find_all_by_quantity("5").count
  end

  def test_it_returns_a_find_all_by_unit_price_match
    assert_equal 1, invoice_item_repo.find_all_by_unit_price("13635").count
  end

end