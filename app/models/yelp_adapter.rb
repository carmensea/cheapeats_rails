require 'httparty'

class YelpAdapter
  include HTTParty
  base_uri ENV['YELP_SEARCH_URL']
  format :json

  def initialize
    @api_key = ENV["ACCESS_TOKEN"]
    @open_now = true
    @price = 1
    @sort_by = "rating"
  end

  def custom_search(params)
    term = params['term']
    location = params['location']
    @response = HTTParty.get("http://api.yelp.com/v3/businesses/search",
                              { headers:
                                {"Authorization" => "Bearer #{@api_key}",
                              },
                              query:
                               {"location" => location,
    "term" => term,
    "price" => @price,
    "sort_by" => @sort_by,
    "open_now" => @open_now}
    })
    puts "*" * 1000
    parse_data(@response)
  end

  def business_details(hash)
    details = {}
    location = hash[:location]
    details[:name] = hash[:name]
    details[:address] = location["display_address"].join(",")
    details[:phone] = hash[:phone]
    details
  end

  private

    def parse_data(api_response)
      i = 0
      all_results = []
      while i < api_response["businesses"].count
        results = Hash.new
        results[:name] = api_response["businesses"][i]["name"]
        results[:location] = api_response["businesses"][i]["location"]
        results[:phone] = api_response["businesses"][i]["display_phone"]
        all_results << Rest.new(business_details(results))
        i += 1
      end
      all_results
    end
end
