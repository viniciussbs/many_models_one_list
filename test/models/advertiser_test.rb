require 'test_helper'

class AdvertiserTest < ActiveSupport::TestCase
  test 'ads count as a number' do
    assert_equal 42, Advertiser.new(ads_count: 42).ads_count
  end

  test 'helpers methods to check category' do
    assert Advertiser.new(category: 'User').user?
    assert Advertiser.new(category: 'Company').company?
  end

  test 'helper method to say the document type' do
    assert 'CPF', Advertiser.new(category: 'User')
    assert 'CNPJ', Advertiser.new(category: 'Company')
  end
end
