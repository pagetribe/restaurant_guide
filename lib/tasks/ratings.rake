#run wiht rake ratings
task :ratings  => :environment do
  p "importing data....."
#  url = "http://www.eatability.com.au/au/sydney/a-taste-of-india"
  url = "http://www.eatability.com.au/au/sydney/public/search_results.htm?search=alio&ci=1"
#  url = "http://www.eatability.com.au/au/sydney/public/search_results.htm?search=Ajisen+Ramen&ci=1"
  doc = Nokogiri::HTML(open(url))
#  p doc
#  venuelisttext
#  p doc.at_css(".overallRating").text
#  p doc.at_css(".readingtext tr:nth-child(1) td:nth-child(7)").text
  p doc.at_css(".venuelisttext").attributes['href'].value
  
  p "finished import"
end
