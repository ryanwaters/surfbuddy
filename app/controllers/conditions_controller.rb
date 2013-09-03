class ConditionsController < ApplicationController
  require 'json'
  require 'open-uri'
  

  def index
      
      @graph_113 = get_forecast(113)
      @graph_649 = get_forecast(649)
      @graph_648 = get_forecast(648)
      @graph_697 = get_forecast(697)
      @graph_114 = get_forecast(114)
      @graph_117 = get_forecast(117) 

  end

  def get_forecast(spot_id) 

    
    url = "http://api.spitcast.com/api/spot/forecast/#{spot_id}/"
    results = JSON.load(open(url).read)

    return results.map do |x|
      {"x" => x['gmt']+":00", "size" => x['size_ft'].round(2)}
      #.to_s.gsub("PM", "").gsub("AM","")x

    end
  end
end

