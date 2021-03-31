class CLI
    def start
        puts "Welcome to Studio Ghibli movie finder! What is your name?"
        API.get_data
        input = user_input
        greet(input)
    end
    def user_input
        gets.strip
    end
    def greet(name)
        puts "Gretings #{name} let's get started! Would like like to see some of Studio Ghibli's movies today? Enter y to see list, enter exit to exit"
        menu
    end
    def menu
        selection = user_input
        if selection == "y"
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
        puts "whoa...that doesn't seem to look right. Could you try again please?"
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
        movie_detail(title)
    end

    def movie_detail(title)
        if title == "exit"
            goodbye
        elsif title.class == Movies
        puts ""
        puts ""
        puts "-------------------------------------"
        puts "Name: #{title.name}"
        puts "Stats: #{title.info}"
        puts "-------------------------------------"
        puts ""
        puts ""
        puts "enter y to see more movie or exit to exit"
        else 
            invalid
        end
    end
end