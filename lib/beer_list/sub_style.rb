class SubStyle
  attr_accessor :name, :region
    @@all = []
    def self.all
      puts "#{@@all}"
    end
end
