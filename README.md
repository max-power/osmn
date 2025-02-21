# OSMN [![Maintainability](https://api.codeclimate.com/v1/badges/dd21f82be412394ac8ea/maintainability)](https://codeclimate.com/github/max-power/osmn/maintainability)

A Ruby wrapper for the OpenStreetMap Nominatim API.

> Nominatim is a tool to search osm data by name and address 
and to generate synthetic addresses of osm points (reverse geocoding). 

Service can be found at http://nominatim.openstreetmap.org  
API Details can be found at https://nominatim.org/release-docs/develop/api/Overview/

## Installation

    $ gem install osmn

## Usage
### The easy way:
```ruby
# search for a place
OSMN.search('135 pilkington avenue, birmingham')

# convert latitude and longitude into a place
OSMN.reverse_geocode(52.5487429714954, -1.81602098644987)

# lookup osm id
lookup = OSMN.lookup("R146656","W50637691","N240109189")
lookup.map(&:name) # => ["Manchester", "Brandenburger Tor", "Berlin"]


# OSMN status
OSMN.status
```

### Search with parameters:
You can set any parameter defined in the Nominatim documentation page (https://nominatim.org/release-docs/develop/api/Search/)

```ruby
OSMN.search('10117 Berlin', country: "DE", format: :geojson, polygon_geojson: true)
OSMN.search('Paris', featureType: 'city')
OSMN.reverse_geocode(52.5487429714954, -1.81602098644987, addressdetails: true)

params = {
    lat: 52.5487429714954, 
    lon: -1.81602098644987, 
    'accept-language': 'en', 
    osm_type: 'W', 
    zoom: 18, 
    addressdetails: 1
}
OSMN.search(params)
```


Check the complete list of parameters for each query on the Nominatim documentation page (https://nominatim.org/release-docs/develop/api/Search/)

## License
Copyright (c) 2012, Jorge Kalmbach <kalmbach.at.gmail.com>

Permission is hereby granted, free of charge, to any
person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the
Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice
shall be included in all copies or substantial portions of
the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
