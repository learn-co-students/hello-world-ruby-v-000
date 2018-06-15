class Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com/beer/style/"))
  end
end
