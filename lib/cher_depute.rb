require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rspec'
require 'rubocop'

$annuaire = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

def get_deputies_urls
  url_mairies_full = []
  url_mairies_full = $annuaire.xpath('//*[@id="deputes-list"]/div/ul/li/a').map { |link| "https://www.nosdeputes.fr"+link["href"] }
  return url_mairies_full
end

#p get_deputies_urls

def get_deputies_first_name_and_last_name
  deputies_names = []
  $annuaire.xpath('//*[@id="deputes-list"]/div/ul/li/a').each do |node|
    deputies_names <<  node.text
  end
  deputies_names
end

#p get_deputies_first_name_and_last_name

def get_deputies_first_name(array_names)
  deputies_first_name = []
  array_names.each do |name|
    array = name.split(' ')
    array
    deputies_first_name << array[1]
  end
  deputies_first_name
end

#p get_deputies_first_name(get_deputies_first_name_and_last_name)

def get_deputies_last_name(array_names)
  deputies_last_name = []
  array_names.each do |name|
    array = name.split(' ')
    array
    deputies_last_name << array[2]
  end
  deputies_last_name
end

#p get_deputies_last_name(get_deputies_first_name_and_last_name)

def extract_email_of_url(url)
  array_emails_deputies = []
  url.each do |i|
    page_profil = Nokogiri::HTML(open(i))
    page_profil.css('dl > dd > ul > li[2] > a').each do |node|
      array_emails_deputies << node.text
    end
  end
  array_emails_deputies
end

#p extract_email_of_url(get_deputies_urls)

def name_and_emails_in_hash
  result = []
  i = 0
  names.each do |key|
    result << {"first_name" => value, "last_name" => value, "email" => value}
    i += 1
  end
  result
end

def my_depute_list
  names = get_deputies_first_name(get_deputies_first_name_and_last_name)
  firstnames =  get_deputies_last_name(get_deputies_first_name_and_last_name)
  mail = extract_email_of_url(get_deputies_urls)
  i = 0
end

p my_depute_list

#p names_and_emails_in_hash(get_deputies_first_name(get_deputies_first_name_and_last_name), get_deputies_last_name(get_deputies_first_name_and_last_name), extract_email_of_url(get_deputies_urls))

