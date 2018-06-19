#CLI Controller

class BeerList::CLI

  def call
    menu
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
        puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE BEER OF CHOICE"
        puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
         self.list_beers
      elsif answer == "2"
        puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE STYLE OF CHOICE"
        puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
        self.list_parent_styles
      elsif answer == "3"
        puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE REGION OF CHOICE"
        puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
        self.list_regions
      elsif answer == "4"
        puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE SUB-STYLE OF CHOICE"
        puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
        answer4 = nil
        while answer4 != "exit"
          puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE SORTING METHOD OF CHOICE"
          puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
          puts "1. SORT BY ABV"
          puts "2. SORT BY BA-SCORE"
          puts "3. SORT BY TOTAL REVIEWS"
          answer4 = gets.strip
          if answer4 == "1"
              puts "SORTING BY ABV:"
              puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE SUB-STYLE OF CHOICE"
              puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
              self.list_sub_styles
              answer4_1 = nil
              while answer4_1 != "exit"
                answer4_1 = gets.strip
                if answer4_1 != "main"
                  self.list_sub_style_abv(answer4_1)
                elsif answer_4_1 == "main"
                  menu
                elsif answer4_1 == "exit"
                  answer = answer4_1
                end
              end
          elsif answer4 == "2"
            puts "SORTING BY BA-SCORE"
            puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE SUB-STYLE OF CHOICE"
            puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
            self.list_sub_styles
            answer4_2 = nil
            while answer4_2 != "exit"
              answer4_2 = gets.strip
              if answer4_2 != "main"
                self.list_sub_style_score(answer4_2)
              elsif answer_4_2 == "main"
                menu
              elsif answer4_2 == "exit"
                answer = answer4_2
              end
            end
          elsif answer4 == "3"
            puts "SORTING BY REVIEW TOTAL:"
            puts "PLEASE SELECT THE NUMBER THAT CORRESPONDS WITH THE SUB-STYLE OF CHOICE"
            puts "OTHERWISE ENTER 'EXIT' TO LEAVE OR 'MAIN' TO RETURN TO THE MAIN MENU"
            self.list_sub_styles
            answer4_3 = nil
            while answer4_3 != "exit"
              answer4_3 = gets.strip
              if answer4_3 != "main"
                self.list_sub_style_reviews(answer4_3)
              elsif answer_4_3 == "main"
                menu
              elsif answer4_3 == "exit"
                answer = answer4_3
              end
            end
          elsif answer4 == "main"
            menu
          elsif answer4 == "exit"
            answer = answer4
          end
        end
      end
     end
   end

   def list_regions
     Region.all.each_with_index do |region, index|
       puts "#{index + 1}. #{region.name}"
     end
   end

   def list_parent_styles
     puts "1. Ales"
     puts "2. Lagers"
   end

   def list_sub_styles
     SubStyle.all.each_with_index do |sub_style, index|
       puts "#{index + 1}. #{sub_style.name}"
     end
   end

   def list_sub_style_score(answer.to_i)
    choice = SubStyle.all[answer - 1]
    list = choice.style_beers.sort_by! {|beer| beer.score}
    puts "SHOWING ALL #{choice.name}'S SORTED BY BA-SCORE"
    list.each_with_index do |beer, index|
      puts "#{index + 1}. #{beer.name} #{beer.score}"
    end
   end

   def list_sub_style_abv(answer.to_i)
     choice = SubStyle.all[answer - 1]
     choice.style_beers.sort_by! {|beer| beer.abv}
   end

   def list_sub_style_reviews(answer.to_i)
     choice = SubStyle.all[answer - 1]
     choice.style_beers.sort_by! {|beer| beer.reviews}
   end

   def list_beers
     Beer.all.each_with_index do |beer, index|
       puts "#{index + 1}. #{beer.name}"
     end
   end

end
