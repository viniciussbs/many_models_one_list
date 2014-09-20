require 'test_helper'

class AdvertiserTest < ActiveSupport::TestCase
  test 'ads count as a number' do
    assert_equal 42, Advertiser.new(ads_count: 42).ads_count
  end

  test 'document can be cpf or cnpj' do
    cpf  = "04204200042"
    cnpj = "42420040420420"

    assert_equal cpf, Advertiser.new(document: cpf).document
    assert_equal cnpj, Advertiser.new(document: cnpj).document
  end

  test 'category' do
    assert_equal 'User', Advertiser.new(category: 'User').category
    assert_equal 'Company', Advertiser.new(category: 'Company').category
  end

  test 'method to check if advertiser is an user' do
    assert Advertiser.new(category: 'User').user?
  end

  test 'method to check if advertiser is a company' do
    assert Advertiser.new(category: 'Company').company?
  end

  test 'document type' do
    assert 'CPF', Advertiser.new(category: 'User').document_type
    assert 'CNPJ', Advertiser.new(category: 'Company').document_type
  end
end
