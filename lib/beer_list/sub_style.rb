class SubStyle
  attr_accessor :name, :region, :parent_style, :url, :style_beers
    @@all = []

    def self.all
      @@all
    end

    def initialize(sub_style_hash)
      sub_style_hash.each {|key, value| self.send(("#{key}="), value)}
      @@all << self
      @style_beers = []
    end

    def self.prints_all
      self.all.each_with_index do |sub_style, index|
        puts "#{index + 1}. #{sub_style.name}"
      end
    end
end
