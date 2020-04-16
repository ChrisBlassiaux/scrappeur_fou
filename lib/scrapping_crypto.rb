require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'
require 'rubocop'

def name_crypto_in_array
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  crypto_name_array = []
  doc.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div').each do |node|
    crypto_name_array << node.text
  end
  crypto_name_array
end

def cours_crypto_in_array
  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  crypto_cours_array = []
  doc.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a').each do |node|
    crypto_cours_array << node.text
  end
  crypto_cours_array
end

def name_and_cours_in_hash(name, cours)
  result = []
  i = 0
  name.each do |key|
    result << {key => cours[i].gsub(/[^\d^.]/, '').to_f}
    i += 1
  end
  result
end

#p name_and_cours_in_hash(name_crypto_in_array, cours_crypto_in_array).class