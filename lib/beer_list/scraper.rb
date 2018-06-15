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
end

=begin
<table width="100%" cellpadding="2" cellspacing="0" border="0">
<tbody><tr>
<td align="left" valign="top" bgcolor="#000000"><span style="color: #FFFFFF; font-weight: bold; font-size: 8pt;">Hybrid Styles</span></td>
<td width="100" align="left" valign="top" class="hr_bottom_black">&nbsp;</td>
</tr><tr>
<td colspan="2" align="left" valign="top">
<br><a href="/beer/style/9/">Fruit / Vegetable Beer</a><br><a href="/beer/style/8/">Herbed / Spiced Beer</a><br><a href="/beer/style/11/">Smoked Beer</a></td>
</tr>
</tbody></table>
<td colspan="2" align="left" valign="top">
<br><a href="/beer/style/9/">Fruit / Vegetable Beer</a><br><a href="/beer/style/8/">Herbed / Spiced Beer</a><br><a href="/beer/style/11/">Smoked Beer</a></td>
=end
