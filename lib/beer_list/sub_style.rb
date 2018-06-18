class SubStyle
  attr_accessor :name, :region, :parent_style, :url
    @@all = []

    def self.all
      @@all
    end

    def initialize(sub_style_hash)
      sub_style_hash.each {|key, value| self.send(("#{key}="), value)}
      @@all << self
    end
end
