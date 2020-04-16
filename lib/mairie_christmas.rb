require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'
require 'rubocop'

$annuaire = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

def get_townhall_urls
  url_mairies = []
  url_mairies = $annuaire.css('//table[@class="Style20"]//a').map { |link| link["href"] }
  url_mairies_full = []
  url_mairies.each do |i|
    url_mairies_full << 'http://annuaire-des-mairies.com/' + i
  end
  url_mairies_full 
end

def get_townhall_name
  names_mairies = []
  $annuaire.css('tr > td > p > a').each do |node|
    names_mairies <<  node.text
  end
  names_mairies
end

def extract_email_of_url(url)
  array_emails_mairies = []
  url.each do |i|
    page_cities = Nokogiri::HTML(open(i))
    page_cities.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
      array_emails_mairies << node.text
    end
  end
  array_emails_mairies
end

def name_and_emails_in_hash(names, emails)
  result = []
  i = 0
  names.each do |key|
    result << {key => emails[i]}
    i += 1
  end
  result
end

p name_and_emails_in_hash(get_townhall_name, extract_email_of_url(get_townhall_urls))
