class Region
  attr_accessor :name
    @@all = []

    def self.all
      puts "#{@@all}"
    end
end
