require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_array = []
    doc.css("div.student-card").each do |student|
      student_hash = {}
      student_hash[:name] = student.css("h4.student-name").text
      student_hash[:location] = student.css("p.student-location").text
      student_hash[:profile_url] = student.css("a").attribute("href").value
      student_array << student_hash
    end 
    student_array
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
     student_hash = {}
     all_links = doc.css('a')
     links_array = all_links.map {|element| element["href"]}.compact
    # student_hash[:twitter] = 
    # student_hash[:linkedin] = 
    # student_hash[:github] = 
    # student_hash[:blog] = 
    student_hash[:profile_quote] = doc.css("div.profile-quote").text
    student_hash[:bio] = doc.css("div.bio-content p").text
    binding.pry 
    student_hash
    
  end

end


# twitter   
#linkedin 
# github
# blog 
# profile_quote doc.css("div.profile-quote").text
# bio 
