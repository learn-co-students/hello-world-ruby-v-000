class Scraper

  def get_style_page
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com/beer/style/"))
  end

  def create_regions
    self.get_style_page.css("table td b").each do |region_name|
      new_region_name = region_name.text
      region_split = new_region_name.split(" ")
      if region_split[1] == "Ales"
        new_region_name.gsub!(" Ales", " Beers")
      elsif region_split[1] == "Lagers"
        new_region_name.gsub!(" Lagers", " Beers")
      end
      Region.new(new_region_name) unless Region.all.any? {|region| region.name == new_region_name}
    end
  end


  def create_sub_styles
    sub_styles = []
    self.get_style_page.css("table table").each do |info|
      if info.css("span").text == "Ale Styles"
        info.css("td a").each do |beer_style|
          sub_styles << {
            :name => beer_style.text,
            :parent_style => ParentStyle.all.find {|style| style.name == "Ale"}
          }
          binding.pry
        end
      end
    end
  end
  
  
    

end

=begin
students << {
        :name => student_info.css("div.card-text-container h4.student-name").text,
        :location => student_info.css("div.card-text-container p.student-location").text,
        :profile_url => student_info.css("a").collect  { |link| link['href'] }.join
        }
=end

=begin
sub_style_ales = nil
sub_style_lagers = nil
self.get_style_page.css("table table").each do |info|
  if info.css("span").text == "Ale Styles"
    sub_style_ales = info.css("td a").collect {|beer_style| beer_style.text}
  elsif info.css("span").text == "Lager Styles"
    sub_style_lagers = info.css("td a").collect {|beer_style| beer_style.text}
    binding.pry
  end
end
=end
