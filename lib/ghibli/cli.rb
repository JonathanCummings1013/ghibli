#No case sensitivty 

class CLI 
    def start
        puts "
        
       .|'''|    ||                 ||`                   .|'''''| '||          '||     '||`                
 |     ||        ||                 ||   ''               || .      ||      ''   ||      ||   ''      |     
-|-    `|'''|, ''||''  '||  ||` .|''||   ||  .|''|,       || |''||  ||''|,  ||   ||''|,  ||   ||     -|-    
 |      .   ||   ||     ||  ||  ||  ||   ||  ||  ||       ||    ||  ||  ||  ||   ||  ||  ||   ||      |     
        |...|'   `|..'  `|..'|. `|..||. .||. `|..|'       `|....|' .||  || .||. .||..|' .||. .||.           
                                                                                                              
                                                                                                                                                                                                                                                                                                                                                      
        ".colorize(:yellow)                                                                                                                            
        puts "              Welcome to Studio Ghibli Movie Finder! What is a name I could call you?".colorize(:light_blue) 
        puts "                                            ༼ ⁰o⁰；༽".colorize(:yellow)
        API.get_data
        input = user_input
        greet(input)
    end
    def user_input
        gets.strip
    end
    def greet(name)
        puts ""
        sleep (0.50)
        greeting = "Wow... #{name}, what a nice name! Would you like to see some of Studio Ghibli's movies today? If so, kindly enter yes to see a list of movies otherwise enter exit to exit".colorize(:light_blue)
        greeting.split.each do |word|
            print "#{word} "
            sleep 0.4
          end
        puts ""
        menu
    end
    def menu
        selection = user_input.downcase
        if selection == "yes"
            puts ""
            sleep (1)
            print_films
        elsif selection == "exit"
            goodbye
            #exit 
        else
            invalid
            # invaild message, let them keep chosing 
        end
        #enter y print out movies
        #enter exit to exit
        #invaild message
    end
    def print_films
        # binding.pry
       Movies.all.each.with_index(1) do |films, index|
        puts "#{index}. #{films.title}".colorize(:green)
       end
       select_films
    end
    def select_films
        puts "Enter name of movie you would like to learn more about please.".colorize(:red)
        sleep (0.50)
        puts ""
        selection = user_input.downcase 
        if Movies.find_by_selection(selection)
        films = Movies.find_by_selection(selection)
        else
            films = selection
        end
        movie_detail(films)
    end

    def movie_detail(films)
        if films == "exit"
            goodbye
        elsif films.class == Movies
        puts ""
        puts " Good choice!".colorize(:yellow)
        puts "* ✲ ☆ ⋆(˘ᴗ˘ )".colorize(:green)
        puts ""
        sleep (1.2)
        puts ""
        puts "☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆".colorize(:red)
        puts "Original Title: #{films.original_title}".colorize(:yellow)
        sleep (0.50)
        puts "North American Title: #{films.title}".colorize(:green)
        sleep (0.50)
        puts "Description: #{films.description}".colorize(:blue)
        sleep (0.50)
        puts "Release date: #{films.release_date}".colorize(:red)
        sleep (0.50)
        puts "How long: #{films.running_time} minutes".colorize(:yellow)
        sleep (0.50)
        puts ""
        puts "☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆ ~ ☆".colorize(:red)
        puts ""
        puts ""
        sleep (0.50)
        puts "enter yes to see more movie or exit to exit".colorize(:yellow)
        menu
        else 
            invalid
        end
    end

    def invalid 
        puts ""
        puts "                            ut oh"
        puts "                           (　´_ﾉ`)".colorize(:yellow)
        sleep (0.75)
        puts "...that doesn't seem to look right. Could you try again please? ^_^".colorize(:yellow)
        sleep (0.50)
        puts ""
        puts "         enter yes to see more movies or exit to exit".colorize(:yellow)
        menu
    end    

    def goodbye
        puts "

        ....▓▓▓▓
        ..▓▓......▓
        ..▓▓......▓▓..................▓▓▓▓
        ..▓▓......▓▓..............▓▓......▓▓▓▓
        ..▓▓....▓▓..............▓......▓▓......▓▓
        ....▓▓....▓............▓....▓▓....▓▓▓....▓▓
        ......▓▓....▓........▓....▓▓..........▓▓....▓
        ........▓▓..▓▓....▓▓..▓▓................▓▓
        ........▓▓......▓▓....▓▓
        .......▓.................▓
        .....▓.....................▓
        ....▓......^..........<.....▓
        ....▓............❤...... ...▓
        ....▓........................▓
        ......▓..........ٮ.........▓
        ...........▓▓.........▓▓
        ...............▓...
                                                                                                                                 
".colorize(:green)
        puts "        Thank you for visiting us!".colorize(:red)
        sleep (0.50)
        puts "           ＼(´▽｀*)(*´▽｀)/".colorize(:yellow)
        puts "            come back soon".colorize(:green)
        sleep (0.50)
        puts "                 ✿ ✿ ✿ ✿".colorize(:blue)
    end




end
# People: #{films.people}