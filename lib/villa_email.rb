require 'rubygems'
require 'nokogiri'
require 'open-uri'
def loadnet
	puts ("wait please , I'm loading data now")
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	return page
end	
def take_ville_array(data)
	take_ville = data.xpath('//a[@class="lientxt"]')
	creat_ville_array = []
	for i in 0..take_ville.length-1 do
		creat_ville_array << take_ville[i].text
	end
	return creat_ville_array
end
#puts take_ville_array(loadnet)
def take_lien(data)
	pag = Array.new()
	take_lien = data.xpath('//a[@class="lientxt"]')
	creat_lien_array = []
	creat_email_array = []
	for i in 0..take_lien.length-1 do
		creat_lien_array << take_lien[i]['href']
		creat_lien_array[i][0] = "https://annuaire-des-mairies.com"
		pag = Nokogiri::HTML(open("#{creat_lien_array[i]}"))
		creat_email = pag.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
		creat_email_array  << creat_email.text	
	end
	return creat_email_array
end
#puts take_lien(loadnet)
def assemblage(ville , email)
	result = []
	for i in 0..email.length-1 do 
		result << {ville[i] => email[i]}
	end
	puts result
	return result
end
def recap
	check1 = take_ville_array(loadnet)
	check2 = take_lien(loadnet)
	assemblage(check1,check2)
end
recap



