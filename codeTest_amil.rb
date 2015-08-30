require 'nokogiri'
require 'open-uri'

url = "http://themoneyconverter.com/rss-feed/USD/rss.xml"

data = Nokogiri::HTML(open(url))
desc = data.xpath("//description")

puts "==THESE ARE THE AVAILABLE CURRENCY CONVERSION FOR US DOLLAR=="
puts "Norway
China
Philippines
Russia
Japan

"
print "Enter a country: "
input= gets.chomp
input.capitalize!
currencyCode = {
	'Norway' => 'Norwegian Krone',
	'China' => 'Chinese Yuan',
	'Philippines' => 'Philippine Peso',
	'Russia' => 'Russian Rouble',
	'Japan' => 'Japanese Yen',
}

i=0
status = false
country = currencyCode["#{input}"]

if country
	loop do
		if desc[i].text.include? "#{country}"
				puts desc[i].text
				status = true
		else
			i += 1
		end
		break if  status == true
	end
else
	puts "No currency rate available for this country"
end
