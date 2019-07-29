require 'rubygems'
require 'nokogiri'
require 'open-uri'

def loadnet
	puts "wait a moment please, I'm loading"
	page = Nokogiri::HTML(open("http://www.assemblee-nationale.fr/qui/xml/regions.asp?legislature=14"))
	return page
end
def find_name(data)
	member_name = data.xpath('//a[@class="dep2"]')
	member_name_array = []
	fa = []
	rack = []
	for i in  0..member_name.length-1 do
		member_name_array << member_name[i].text
		fa << member_name_array[i].split
		fa[i][0] = " "
	end
	for i in 0..member_name.length-1 do
		rack << {"first_name" => fa[i][1] , "last_name" => fa[i][2..fa.length-1].join( " ")}
	end
	return rack
end

#puts find_name(loadnet)
def find_email(data)

	check_lien = data.xpath('//a[@class="dep2"]')
	check_lien_array = []
	member_email_array = []
	for i in  0..check_lien.length-1 do
		check_lien_array << check_lien[i]['href']
		check_lien_array[i][0] = "http://www.assemblee-nationale.fr/"
		pag = Nokogiri::HTML(open("#{check_lien_array[i]}"))
		member_email = pag.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
		member_email_array << member_email[i]
	end
	return check_lien_array
end
puts find_email(loadnet)

