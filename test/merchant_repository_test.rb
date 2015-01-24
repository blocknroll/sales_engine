require_relative 'test_helper'

class MerchantRepositoryTest < Minitest::Test

  def setup
    @merchant_repo = MerchantRepository.new("test/fixtures/merchants_fixtures.csv")
  end

  def test_it_exists
    assert @merchant_repo
  end

  def test_the_file_to_read_exists
    assert File.exist?(@merchant_repo.file_to_read)
  end

  #you could test that the customer list is full of customers - customer_repo.customer_list.first.class (the class of the first thing in it is a customer - it fills with customers not just items.)

  def test_it_returns_all_instances
    assert_equal 10, @merchant_repo.all.count
  end

  def test_it_returns_a_random_instance
    @test = []
    100.times { @test << @merchant_repo.random }
    @test = @test.uniq
    assert @test.count > 1
    #create an empty array and shovel in 100 samples from the merchant repo (you are grabbing 100 samples from all the merchants that are located in the merchant repo). Then run uniq on the sample array, and it will pull out all the values that are duplicates. probably you will have 10 in there, very likely you'll have 9, but it is almost certain that you will have more than 1. So that is how you can test if it is returning a random instance.
  end

  def test_it_returns_a_find_by_id_match
    assert_equal "1", @merchant_repo.find_by_id("1")
  end

  def test_it_returns_a_find_by_name_match
    assert_equal "Schroeder-Jerde", @merchant_repo.find_by_name("Schroeder-Jerde")
  end

  def test_it_returns_a_find_by_name_lowercase_match
    assert_equal "Schroeder-Jerde", @merchant_repo.find_by_name("schroeder-jerde")
  end

  def test_it_returns_a_find_by_created_at_match
    assert_equal "2012-03-27 14:53:59 UTC", @merchant_repo.find_by_created_at("2012-03-27 14:53:59 UTC")
  end

  def test_it_returns_a_find_by_updated_at_match
    assert_equal "2012-03-27 14:53:59 UTC", @merchant_repo.find_by_updated_at("2012-03-27 14:53:59 UTC")
  end

  # find_all_by_id

  def test_it_returns_a_find_all_by_id_match
    assert_equal 1, @merchant_repo.find_all_by_id("1").count
    assert_equal 1, @merchant_repo.find_all_by_id("9").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_id_match_exists
    assert_equal [], @merchant_repo.find_all_by_id("Schroeder-Jorge")
    assert_equal [], @merchant_repo.find_all_by_id(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_id_match_exists
    assert_equal 0, @merchant_repo.find_all_by_id("Schroeder-Jorge").count
    assert_equal 0, @merchant_repo.find_all_by_id(" ").count
  end

  # find_all_by_name

  def test_it_returns_a_find_all_by_name_match
    assert_equal 3, @merchant_repo.find_all_by_name("Williamson Group").count
    assert_equal 1, @merchant_repo.find_all_by_name("Hand-Spencer").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_name_match_exists
    assert_equal [], @merchant_repo.find_all_by_name("Schroeder-Jorge")
    assert_equal [], @merchant_repo.find_all_by_name(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_name_match_exists
    assert_equal 0, @merchant_repo.find_all_by_name("Schroeder-Jorge").count
    assert_equal 0, @merchant_repo.find_all_by_name(" ").count
  end

  # find_all_by_created_at

  def test_it_returns_a_find_all_by_created_at_match
    assert_equal 9, @merchant_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").count
    assert_equal 1, @merchant_repo.find_all_by_created_at("2014-03-27 14:54:00 UTC").count
  end

  def test_it_returns_an_empty_array_when_no_find_all_by_created_at_match_exists
    assert_equal [], @merchant_repo.find_all_by_created_at("1999")
    assert_equal [], @merchant_repo.find_all_by_created_at(" ")
  end

  def test_it_returns_zero_when_no_find_all_by_created_at_match_exists
    assert_equal 0, @merchant_repo.find_all_by_created_at("1999").count
    assert_equal 0, @merchant_repo.find_all_by_created_at(" ").count
  end

end
