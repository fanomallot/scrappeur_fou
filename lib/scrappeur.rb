require 'rubygems'
require 'nokogiri'
require 'open-uri'

def download_data
	puts "search data "
	page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	return page
end
def take_symbols(data)
	all_symbol = data.xpath('//td[@class="text-left col-symbol"]')
	all_symbol_array = []
	for i in 0..all_symbol.length-1 do 
		all_symbol_array << all_symbol[i].text
	end
	return all_symbol_array
end
def take_price(data)
	all_price = data.xpath('//a[@class="price"]')
	all_price_array = []
	for i in 0..all_price.length-1 do 
		all_price_array << all_price[i].text
	end
	return all_price_array
end
def combin_theme(symbol,price)
	result = []
	for i in 0..symbol.length-1 do 
		result << {symbol[i] => price[i].scan(/\d/).join('').to_f}
	end
	puts result
	return result
end
def call_theme
	loading = download_data
	symbol = take_symbols(loading)
	price = take_price(loading)
	combin_theme(symbol,price)
end
call_theme
