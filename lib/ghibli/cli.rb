#No case sensitivty 

class CLI 
    def start
        puts <<-'EOF'
                 __                     __                         
        _|_ \|/ (_ _|_      _| o  _    /__ |_  o |_  | o \|/   _|_ 
         |  /|\ __) |_ |_| (_| | (_)   \_| | | | |_) | | /|\    |  
                                                                   
                                                
                                                                                                                                   
EOF
        puts "Welcome to Studio Ghibli Movie Finder! What is a name I could call you?".colorize(:light_blue) 
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
        puts "Wow... #{name}, what a nice name! Would you like to see some of Studio Ghibli's movies today? If so, kindly enter yes to see a list of movies otherwise enter exit to exit".colorize(:light_blue)
        puts ""
        menu
    end
    def menu
        selection = user_input
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

    def goodbye
        puts <<-'EOF'

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
                                                                                                                                 
EOF
        puts "        Thank you for visiting us!".colorize(:red)
        sleep (0.50)
        puts "            come back soon".colorize(:red)
        sleep (0.50)
        puts "                 xoxo".colorize(:red)
    end
    def invalid 
        puts "well...that doesn't seem to look right. Could you try again please? ^_^".colorize(:light_pink)
        sleep (0.50)
        puts ""
        puts "enter yes to see more movie or exit to exit".colorize(:light_pink)
        menu
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
        sleep (2)
        puts ""
        selection = user_input 
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
        puts ""
        puts "-------------------------------------".colorize(:red)
        puts "Original Title: #{films.original_title}".colorize(:yellow)
        sleep (1)
        puts "North American Title: #{films.title}".colorize(:green)
        sleep (1)
        puts "Description: #{films.description}".colorize(:blue)
        sleep (1)
        puts "Release date: #{films.release_date}".colorize(:red)
        sleep (1)
        puts "How long: #{films.running_time} minutes".colorize(:yellow)
        sleep (1)
        puts ""
        puts "-------------------------------------".colorize(:red)
        puts ""
        puts ""
        sleep (1)
        puts "enter yes to see more movie or exit to exit"
        menu
        else 
            invalid
        end
    end
end
# People: #{films.people}