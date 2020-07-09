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
           Main.bmo
           joke = self.random_joke
           joke.display_joke(user_instance)
          
           
        when "Show me what you got!"
            # offers geres 
            # shows jokes based off those options
            user_input = self.prompt.select("Choose: ", self.all_the_jokes_genres, filter: true)
            # search by joke genre and display it 
            joke_array = self.find_by_genre(user_input)
            self.deploy_the_jokes(joke_array, user_instance)
        else
            newmain = Main.new()
            newmain.users_interface(user_instance)
        end
    end

    def self.random_joke
    
       joke = self.all.sample
       
       joke
    end
    def self.all_the_jokes_genres
        Joke.all.map do |joke_inst|
            joke_inst.genre
        end.uniq
    end
    def self.find_by_genre(search_genre)
        jokes = self.all.where(genre: search_genre) 
    end
    def self.deploy_the_jokes(array_of_jokes,user_instance)
        array_of_jokes.each do |joke_instance|
            joke_instance.display_joke(user_instance)
        end
    end
    def display_joke(user_instance)
        
        joke_table = TTY::Table.new ["Your Joke is :"],[[self.content]]

        puts joke_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1])
      
        self.users_next_joke(user_instance)
        Main.bmo
    end

    def users_next_joke(user_instance)
        users_input = self.class.prompt.select("What would you like to do next?", ["Give a comment!!", "Take me to Jokes main"])
        if users_input == "Give a comment!!"
            # make a comment from user
            self.add_a_comment(user_instance)
        else users_input == "Take me to Jokes main"
            # go back to jokes main interface
            Main.bmo
            
            Joke.joke_interface(user_instance)
        end
    end

    def add_a_comment(user_instance)
        users_input = self.class.prompt.ask("What are your thoughts?")
        new_comment = Comment.create(content:users_input, joke_id: self.id, user_id: user_instance.id)
        binding.pry
        self.display(new_comment)
    end

    def display(comment)
        
        comment_table = TTY::Table.new ["Comment :", "user"],[
        [comment.content, comment.user_id]]
        puts comment_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1])
        
    end
end