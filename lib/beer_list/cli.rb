#CLI Controller

class BeerList::CLI

  def call
    menu
  end

  def create_parent_styles
    lager = ParentStyle.new("Lager")
    ale = ParentStyle.new("Ale")
  end

  def menu
    puts "GREETINGS USER!"
    puts "PLEASE ENTER THE CORRESPONDING NUMBER FOR THE FOLLOWING OPTIONS"
    puts "HOW WOULD YOU LIKE TO SORT YOUR BEER LIST?"
    puts "1. LIST THE TOP BEERS IN THE WORLD"
    puts "2. SEPERATE BETWEEN ALES AND LAGERS"
    puts "3. CHOOSE BY REGION"
    puts "4. CHOOSE BY SUBSTYLE"
    puts "OTHERWISE, ENTER 'EXIT'"
    answer = nil
    while answer != "exit"
      answer = gets.strip
      if answer == "1"
         puts "1"
      elsif answer == "2"
        puts "2"
      elsif answer == "3"
        puts "3"
      elsif answer == "4"
        puts "4"
      end
     end
   end

end
