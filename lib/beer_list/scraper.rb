class Scraper

  def get_style_page
    doc = Nokogiri::HTML(open("https://www.beeradvocate.com/beer/style/"))
  end

  def get_style_page

  end

end

=begin
<td align="left" valign="top" bgcolor="#000000"><span style="color: #FFFFFF; font-weight: bold; font-size: 8pt;">Lager Styles</span></td>
<span style="color: #FFFFFF; font-weight: bold; font-size: 8pt;">Lager Styles</span>
=end
