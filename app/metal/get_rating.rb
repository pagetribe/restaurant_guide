# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class GetRating
  
  def self.call(env)
#    req = Rack::Request.new(env)
#    @params = req.params

    if env["PATH_INFO"] =~ /^\/get_rating/
#      [200, {"Content-Type" => "text/html"}, scrape_rating(env["QUERY_STRING"]).gsub(/name=/, "")]
#      [200, {"Content-Type" => "text/html"}, ["hello....."]]
#      body = scrape_rating(@params["name"])
#      body = scrape_rating(env["QUERY_STRING"]).gsub(/name=/, "")
#      body = scrape_rating(env["QUERY_STRING"]).gsub(/name=/, "")
#      body = doc.at_css("title").text
#      body = "hello wolrd"
      [200, {"Content-Type" => "text/html"}, [scrape_rating(env["QUERY_STRING"].gsub(/name=/, ""))]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
  
  def self.scrape_rating(name)
#    url = "http://www.eatability.com.au/au/sydney/" 
# this works -------- but sometimes the name is different to the given name
#    url = "http://www.eatability.com.au/au/sydney/#{name.downcase.gsub(/\+/, "-")}" 
#    doc = Nokogiri::HTML(open(url))
#    doc.at_css(".overallRating").text

#    debugger

    url = "http://www.eatability.com.au/au/sydney/public/search_results.htm?search=#{name}" 
    doc = Nokogiri::HTML(open(url))
    #setup json    
    data = {}
    data['rating'] = doc.at_css(".readingtext tr:nth-child(1) .venueListRating").text
    data['url'] = "http://www.eatability.com.au#{doc.at_css('.venuelisttext').attributes['href'].value}#user_reviews"

#     data['rating'] = "6" 
#    data = {}
#    data['rating'] = doc.at_css(".readingtext tr:nth-child(1) .venueListRating").text
    
#    doc.at_css(".venueListRating").text
#    return doc.at_css(".overallRating").text
#    doc.at_css("#sbl a:nth-child(2)").text
#    return doc.at_css("title").text
#    x
#    data = {}
#    data['name'] = name
#    data['url'] = "http://www.eatability.com.au"
    return data.to_json
  end

end
#    url = "http://www.google.com.au"
#    doc = Nokogiri::HTML(open(url))
#    doc.at_css("title").text
#    restaurant_name = name
#    debugger
#    x =1
#    return CGI::unescape(name)

