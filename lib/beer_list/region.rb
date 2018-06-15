class Region
  attr_accessor :name
    @@all = []
    @@all_with_parent_styles = []

    def initialize(name)
      @name = name
      @@all << self
    end

    def self.all
      @@all
    end

    def self.prints_all
      puts "#{@@all}"
    end

end
