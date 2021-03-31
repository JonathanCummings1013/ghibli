class CLI
    def start
        puts "Welcome to Studio Ghibli Movie Finder! What is a name i could call you?"
        API.get_data
        input = user_input
        greet(input)
    end
    def user_input
        gets.strip
    end
    def greet(name)
        puts ""
        puts "Wow... #{name}, what a nice name! Would you like to see some of Studio Ghibli's movies today? If so, kindly Enter y to see a list of movies otherwise enter exit to exit"
        puts ""
        menu
    end
    def menu
        selection = user_input
        if selection == "y"
            puts ""
            print_films
        elsif selection == "exit"
            goodbye
            #exit 
        else
            invalid
            # invaild message, let them keep chosing 
        end
        #enter y print out thralls
        #enter exit to exit
        #invaild message
    end

    def goodbye
        puts "Thank you for visiting us!"
    end
    def invalid 
        puts "well...that doesn't seem to look right. Could you try again please? ^_^"
        menu
    end
    def print_films
        # binding.pry
       Movies.all.each.with_index(1) do |films, index|
        puts "#{index}. #{films.title}"
       end
       select_films
    end
    def select_films
        puts "Enter name of movie you would like to learn more about please."
        selection = user_input #put in movie.rb for the string
        if Movies.find_by_selection(selection)
        films = Movies.find_by_selection(selection)
        else
            title = selection
        end
        movie_detail(films)
    end

    def movie_detail(films)
        if films == "exit"
            goodbye
        elsif films.class == Movies
        puts ""
        puts ""
        puts "-------------------------------------".colorize(:light_blue)
        puts "Original Title: #{films.original_title}"
        puts "Name: #{films.title}"
        puts "Description: #{films.description}"
        puts "Release date: #{films.release_date}"
        puts "How long: #{films.running_time} minutes"
        puts ""
        puts "-------------------------------------".colorize(:light_blue)
        puts ""
        puts ""
        puts "enter y to see more movie or exit to exit"
        menu
        else 
            invalid
        end
    end
end
# People: #{films.people}