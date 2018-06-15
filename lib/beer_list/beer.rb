

class Beer
  attr_accessor :name, :sub_style, :region, :availability, :abv, :url
  @@all = []

  def initialize(beer_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    puts "#{@@all}"
  end
end
