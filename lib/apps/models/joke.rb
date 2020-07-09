class Joke < ActiveRecord::Base
    has_many :likes, through: :users
    has_many :comments, through: :users
    @@prompt = TTY::Prompt.new(active_color: :yellow )
    def self.prompt
        @@prompt 
    end

    def self.joke_interface(user_instance)
        Main.bmo
        user_instance.display_profile
        options = [
            "Suprise me ~~~",
            "Show me what you got!",
            "Main Menu"
        ]
        users_input = self.prompt.select("Welcome to Jokes, what would you like to do?", options )
        case users_input
        when "Suprise me ~~~"
            # method generates a random joke
            # disply comments and option to comment
           
           joke = self.random_joke
          
           joke.display_joke
          
           
        when "Show me what you got!"
            # offers geres 
            # shows jokes based off those options
        else
            newmain = Main.new()
            newmain.users_interface(user_instance)
        end
    end

    def self.random_joke
    
       joke = self.all.sample
       
       joke
    end

    def display_joke
        
        joke_table = TTY::Table.new ["Joke","likes"],[[self.content,"   "]]

        puts joke_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1])
    end

    def users_next_joke(user_instance)
        users_input = self.prompt.select("What would you like to do next?", ["Give a comment!!", "Take me to Jokes main"])
        if users_input == "Give a comment!!"
            # make a comment from user
        else users_input == "Take me to Jokes main"
            # go back to jokes main interface
            newmain = Main.new()
            newmain.users_interface(self)
        end
    end
end