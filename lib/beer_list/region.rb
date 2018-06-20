class Region
  attr_accessor :name, :sub_styles
    @@all = []

    def initialize(name)
      @name = name
      @@all << self
      @sub_styles = []
    end

    def self.all
      @@all
    end

end
