require_relative 'test_helper'

class MerchantRepositoryTest < Minitest::Test
# To do: remove instance variables.

  def setup
    @merchant_repo = MerchantRepository.new("test/fixtures/merchants_fixtures.csv")
  end

  def test_it_exists
    assert @merchant_repo
  end

  def test_the_file_to_read_exists
    assert File.exist?(@merchant_repo.file_to_read)
  end

  def test_it_adds_all_merchants_to_repo
    skip
    assert 10, @merchant_repo.merchant_list.count
  end



end
