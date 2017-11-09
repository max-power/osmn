require "test_helper"

class SearchTests < MiniTest::Test

  def test_nil_search
    assert_raises ArgumentError do
      OSMN.search
    end
  end

  def test_search
    response = OSMN.search('135 pilkington avenue, birmingham')[0]

    assert_equal('91015286', response.place_id)
  end

  def test_search_with_no_details
    response = OSMN.search('135 pilkington avenue, birmingham', addressdetails: 0)[0]

    assert_respond_to(response, :place_id)
    assert_respond_to(response, :licence)
    assert_respond_to(response, :osm_type)
    assert_respond_to(response, :osm_id)
    assert_respond_to(response, :boundingbox)
    assert_respond_to(response, :lat)
    assert_respond_to(response, :lon)
    assert_respond_to(response, :display_name)
    assert_respond_to(response, :class)
    assert_respond_to(response, :type)

    assert_raises NoMethodError do
      response.address.house_number
    end
  end

  def test_search_with_details
    response = OSMN.search('135 pilkington avenue, birmingham', addressdetails: 1)[0]

    assert_respond_to(response, :place_id)
    assert_respond_to(response, :licence)
    assert_respond_to(response, :osm_type)
    assert_respond_to(response, :osm_id)
    assert_respond_to(response, :boundingbox)
    assert_respond_to(response, :lat)
    assert_respond_to(response, :lon)
    assert_respond_to(response, :display_name)
    assert_respond_to(response, :class)
    assert_respond_to(response, :type)
    assert_respond_to(response, :address)
#    assert_respond_to(response, :icon)

    assert_respond_to(response.address, :house_number)
    assert_respond_to(response.address, :road)
    assert_respond_to(response.address, :suburb)
    assert_respond_to(response.address, :city)
    assert_respond_to(response.address, :county)
    assert_respond_to(response.address, :state_district)
    assert_respond_to(response.address, :state)
    assert_respond_to(response.address, :postcode)
    assert_respond_to(response.address, :country)
    assert_respond_to(response.address, :country_code)
  end
end
