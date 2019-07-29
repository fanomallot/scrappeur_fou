require 'rubygems'
require 'nokogiri'
require 'open-uri'

def loadnet
	puts "wait a moment please, I'm loading"
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036"))
	return page
end
def find_name(data)
	member_name = data.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
	member_name_array = []
	for i in  0..member_name.length-1 do
		member_name_array << member_name[i].text
	end
	return member_name_array 
end
puts find_name(loadnet)