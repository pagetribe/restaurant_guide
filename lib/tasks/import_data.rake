#run wiht rake import_data
task :import_data  => :environment do
  p "importing data....."
  f = File.open("lib/tasks/search-the-book1.aspx.html")
  doc = Nokogiri::HTML(f)
#  p doc.at_css("h4 span").text
  doc.css(".srchResult").each  do |rest|
#    puts "title: #{rest.at_css("h4 span").text}"
#    puts "offer: #{rest.at_css(".gold").text}"
#    p "up to: #{rest.at_css("p:nth-child(4)").inner_html}"
    details = rest.at_css("p:nth-child(4)").inner_html
    if details.index("Up to")
      details = details.gsub(/[\n]|<strong>|<\/strong>|value|Up to:|Page No:|Cuisine Type:|Type:|/, "").split(/<br *\/?>/i)#splits on br
    else
      details = details.gsub(/[\n]|<strong>|<\/strong>|value|Page No:|Cuisine Type:|Type:|/, "").split(/<br *\/?>/i)
      details.unshift("")#prepend to array blank if there is no "Up to" value (to keep array balanced with same # of elements)
    end
    
    details.map!{|e| e.gsub(/<\/?[^>]+>/, '').strip}#remove html and strip white spaces
    details.pop     

    if details[1].index("Card No:")
      details[1] = details[1].split("Card No:")
      details[1].map!{|e| e.strip}
      details.flatten!#above line creates multi dimensional array ["A45" ["456" "87"] "Italian"] flatten makes 1 dimensional
    else
      details.insert(2, "")
    end
#    puts "up to: #{details[0]}"
#    puts "page #: #{details[1]}"
#    puts "card #: #{details[2]}"
#    puts "type: #{details[3]}"
    #p details
    #p details.gsub(/<\/?[^>]+>/, '')

    
#    puts "address: #{rest.at_css("p:nth-child(2)").text}"
#    puts rest.at_css("p:nth-child(2)").inner_html
#    p rest.at_css("p:nth-child(2)").inner_html.gsub(/[\n]/, '').split(/<br *\/?>/i)
#    p rest.at_css("p:nth-child(2)").inner_html.gsub(/[\n]|<\/?[^>]*>/, "")
    address = rest.at_css("p:nth-child(2)").inner_html.gsub(/[\n]|Phone:|More|locations|NSW|Australia|[\.]/, "").split(/<br *\/?>/i)
    address.map!{|e| e.gsub(/[\n]|[\302\240]|<\/?[^>]*>/, "").strip}
    address[1] = "" if address[1] == nil
    if address[1] != ""
      address.insert(2, address[1].last(5).strip) #get postcode and save it
      address[1][-5..-1] = "" #cleanup - remove postcode from Suburb
      address[1] = address[1].strip
    end
#    puts address
    
    #add to database
    restaurant = Restaurant.new
    restaurant.name = rest.at_css("h4 span").text
    restaurant.street = address[0]
    restaurant.suburb = address[1]
    restaurant.phone = address[3]
    restaurant.postcode = address[2]
    restaurant.offer = rest.at_css(".gold").text
    restaurant.up_to = details[0]
    restaurant.page_num = details[1]
    restaurant.card_num = details[2]
    restaurant.cuisine = Cuisine.create!(:name => details[3])
    restaurant.save!
 
  end
  
  f.close
  
  p "finished import"
end
