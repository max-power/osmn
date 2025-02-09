require "test_helper"

class SearchTests < Minitest::Test
  def test_nil_reverse
    assert_raises ArgumentError do
      OSMN.reverse_geocode
    end
  end
  
  def test_reverse
    response = OSMN.reverse_geocode(52.5487921, -1.8164307339635)

    assert_equal '91015286', response.place_id
  end

  def test_reverse_geocode
    response = OSMN.reverse_geocode(52.5487429714954, -1.81602098644987, addressdetails: 0)

    assert_equal "91015268", response.place_id
    assert_equal "Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright", response.licence
    assert_equal "way", response.osm_type
    assert_equal "90394420", response.osm_id
    assert_equal "52.54877605", response.lat
    assert_equal "-1.81627033283164", response.lon
    assert_equal "137, Pilkington Avenue, Sutton Coldfield, Birmingham, West Midlands Combined Authority, West Midlands, England, B72 1LH, UK", response.display_name

    assert_raises NoMethodError do
      response.address.house_number
    end
  end

  def test_reverse_geocode_with_address_details
    response = OSMN.reverse_geocode(52.5487429714954, -1.81602098644987, addressdetails: 1)

    assert_respond_to(response, :place_id)
    assert_respond_to(response, :licence)
    assert_respond_to(response, :osm_type)
    assert_respond_to(response, :osm_id)
    assert_respond_to(response, :lat)
    assert_respond_to(response, :lon)
    assert_respond_to(response, :display_name)
    assert_respond_to(response, :address)

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
