class SubStyle
  attr_accessor :name, :region, :parent_style
    @@all = []
    def self.all
      puts "#{@@all}"
    end
end
