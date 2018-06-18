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
        sub_styles << {
        info.css("td a").each do |beer_style|
          name: = beer_style.text
          binding.pry
        end
      }
      end
    end
    
      
  end 

end

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
