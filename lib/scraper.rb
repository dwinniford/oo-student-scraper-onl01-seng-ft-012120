require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    student_array = {}
    doc.css("div.student-card").each do |student|
      student_hash = {}
      student_hash[:name] = student.css("h4.student-name")
    end 
    
    binding.pry
   
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end


#  all students doc.css("div.student-card")
# name  
# location
# profile_url