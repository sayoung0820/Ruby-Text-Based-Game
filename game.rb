def render_ascii_art
    File.readlines("spaceship.txt") do |line|
      puts line
    end
  end

puts render_ascii_art 
puts "\n" 
puts  "SPACE ADVENTURE TIME \n press Enter to continue" 
gets
puts  "\n" "\n" "\n"
puts "The earth has been destroyed.... You are the last hope for humanity. \nYou must find a new planet to allow humanity to survive. \nYou and your family Winnie, Piglet, Rabbit, Christopher, Owl, Tigger, and Eyeore must travel through the dangers of space. \nYou only have enough honey for five warp jumps. Beware the Humphalump pirates \n \n Press Enter to Continue \n" 
gets
puts "You have encountered your first planet, it is barren and rocky and you see no signs of life. \n Do you want to stop and explore for the chance to find more honey or do you continue your journey?"
$honey = 5
$characters = ["winnie", "piglet", "rabbit", "christopher", "owl", "tigger", "eyeore"]
first_response = gets.chomp.downcase
def first_story first
    if first.include? "explore"
        puts "you land on the planet and encounter a Cave, Enter or Leave the Planet \n \n"
        second_response = gets.chomp.downcase
        def second_story second
            if second.include? "enter" || "explore"
                puts "choose a family member to enter the cave" "Choose among #{$characters.join ", "} \n \n"
                third_response = gets.chomp.downcase
                def third_story third
                    if $characters.include? third
                        options = ["#{third} dies, and you are force to flee the planet \n \n", "#{third} finds two honey \n \n", "#{third} escapes from alien moles, you flee to the ship and leave the planet \n \n"]
                        response = options.sample
                        if response == options[0]
                            $characters.delete third
                            $honey -= 1
                        end
                        if response == options[1]
                            $honey += 2
                        end
                        if response == options[2]
                            $honey -= 1
                        end
                        puts response + "You have #{$honey} Honey left \n"
                    else
                        puts "must be a character on the ship #{$characters.join ", "} \n"
                        new_res = gets.chomp.downcase
                        third_story new_res
                    end
                end
                third_story third_response
            elsif second.include? "leave"
                $honey -= 1
                puts "You leave the planet you have #{$honey} honey left"
            else
                puts "you can only enter or leave \n"
                new_r = gets.chomp.downcase
                second_story new_r
            end
        end
        second_story second_response
    elsif first.include? "leave"
        honey -= 1
        puts "You continue on your journey you only have #{$honey} honey left \n \n"
    else 
        puts "must say either explore or leave \n"
        response = gets.chomp.downcase
        first_story response
    
    end 
end

first_story first_response

puts "After leaving the first planet, your family comes face to face with a roving gang of space pirates. They want to loot your spaceship. Do you fight the pirates or give them your honey?"