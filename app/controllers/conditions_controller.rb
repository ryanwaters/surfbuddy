class ConditionsController < ApplicationController
  require 'json'
  require 'open-uri'
  include SessionsHelper
  

  def index
    
    @graph_113 = get_forecast(113)
    @graph_649 = get_forecast(649)
    @graph_648 = get_forecast(648)
    @graph_697 = get_forecast(697)
    @graph_114 = get_forecast(114)
    @graph_117 = get_forecast(117) 

    @wind = get_wind
    @tide = get_tide
    @get_wind_direction = get_wind_direction   

  end

  def get_forecast(spot_id) 

    
    url = "http://api.spitcast.com/api/spot/forecast/#{spot_id}/"
    results = JSON.load(open(url).read)

    return results.map do |x|
      {"x" => x['gmt']+":00", "size" => x['size_ft'].round(2)}
      #.to_s.gsub("PM", "").gsub("AM","")x

    end
  end

  def get_wind

        url = "http://api.spitcast.com/api/county/wind/san-francisco/"
    results = JSON.load(open(url).read)

    @wind_direction = results.first['direction_text']

    return results.map do |x|
      {"x" => x['gmt']+":00", "wind" => x['speed_mph'].round(2)}
    end
  end
  
  def get_tide

         url = "http://api.spitcast.com/api/county/tide/san-francisco/"
    results = JSON.load(open(url).read)

    return results.map do |x|
      {"x" => x['gmt']+":00", "tide" => x['tide'].round(2)}
    end
  end

  def get_wind_direction

        url = "http://api.spitcast.com/api/county/wind/san-francisco/"
    results = JSON.load(open(url).read)


    return results.map do |x|
      {"x" => x['gmt']+":00", "wind" => x['direction_degrees']}
    end
  end

end

