require 'rubygems'
require 'nokogiri'
require 'open-uri'

def loadnet
	puts ("wait please , I'm loading data now")
	page = Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/95/avernes.html'))
	return page
end	
def take_ville_array(data)
	take_ville = data.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	creat_ville_array = []
	for i in 0..take_ville.length-1 do
		creat_ville_array << take_ville[i].text
	end
	return creat_ville_array

end
puts take_ville_array(loadnet)