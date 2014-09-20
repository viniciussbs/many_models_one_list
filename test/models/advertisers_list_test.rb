require 'test_helper'

class AdvertisersListTest < ActiveSupport::TestCase

  test 'list advertisers ordered by number of ads' do
    user    = User.create(name: "Jhon Doe", cpf: "04204200042", ads_count: 4)
    company = Company.create(name: "ACME", cnpj: "42420040420420", ads_count: 42)

    advertisers = AdvertisersList.new.advertisers

    assert_instance_of Advertiser, advertisers.first
    assert_instance_of Advertiser, advertisers.last

    assert_equal company.ads_count, advertisers.first.ads_count
    assert_equal user.ads_count, advertisers.last.ads_count
  end

  test 'advertisers method accepts a block to iterate over the list' do
    User.create(name: "Jhon Doe", cpf: "04204200042", ads_count: 4)
    Company.create(name: "ACME", cnpj: "42420040420420", ads_count: 42)

    advertisers = []

    AdvertisersList.new.advertisers do |advertiser|
      advertisers << advertiser
    end

    assert_instance_of Advertiser, advertisers.first
    assert_instance_of Advertiser, advertisers.last
  end
end
