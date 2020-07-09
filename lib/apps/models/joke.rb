class Joke < ActiveRecord::Base
    has_many :likes, through: :users
    has_many :comments, through: :users
    @@prompt = TTY::Prompt.new(active_color: :yellow )
    attr_accessor :main, :user
    def self.prompt
        @@prompt 
    end

    def self.joke_interface(user_instance)
        Main.bmo
        user_instance.display_profile
        options = [
            "Suprise me ~~~",
            "Show me what you got!",
            "Mischief Managed"
        ]
        users_input = self.prompt.select("Welcome to Jokes, what would you like to do?", options )
        case users_input
        when "Suprise me ~~~"
            # method generates a random joke
            # disply comments and option to comment
            Main.bmo
           joke = self.all.sample
           joke.display_joke(user_instance)
            
        when "Show me what you got!"
            # offers geres 
            # shows jokes based off those options
            user_input = self.prompt.select("Choose: ", self.all_the_jokes_genres, filter: true)
            # search by joke genre and display it 
            joke_array = self.find_by_genre(user_input)
            joke_instance = joke_array.sample.display_joke(user_instance)
            # self.deploy_the_jokes(joke_array, user_instance)
            joke_instance.users_next_joke(user_instance)
        else
            newmain = Main.new()
            newmain.users_interface(user_instance)
        end
    end

    def self.all_the_jokes_genres
        Joke.all.map do |joke_inst|
            joke_inst.genre
        end.uniq
    end
    def self.find_by_genre(search_genre)
        jokes = self.all.where(genre: search_genre) 
    end
    def deploy_the_comments(user_instance)
        array_of_jokes.each do |joke_instance|
            joke_instance.display_joke(user_instance)
        end
        # self.users_next_joke(user_instance)
    end
    def display_joke(user_instance)
        joke_table = TTY::Table.new ["Your Joke is :"],[[self.content]]

        puts joke_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1])
        self.users_next_joke(user_instance)
    end
    def users_next_joke(user_instance)
        users_input = self.class.prompt.select("What would you like to do next?", ["Give a comment!!", "Another!!", "Take me to Jokes main"])
        case users_input
        when "Give a comment!!"
            # make a comment from user
            Main.bmo
            self.add_a_comment(user_instance)
            self.users_next_joke(user_instance)
        when "Another!!"
            # shows the next joke with same genre as self (instance)
            # gives the user the option again
            Main.bmo
            jokes = Joke.find_by_genre(self.genre)
             joke_instance = jokes.sample
            joke_instance.display_joke(user_instance)
            self.users_next_joke(user_instance)
   
        when "Take me to Jokes main"
            # go back to jokes main interface
            Main.bmo
            Joke.joke_interface(user_instance)
        end
    end

    def add_a_comment(user_instance)
        users_input = self.class.prompt.ask("What are your thoughts?")
        new_comment = Comment.create(content:users_input, joke_id: self.id, user_id: user_instance.id)
        self.update(comment_id: new_comment.id)
        self.display(new_comment,user_instance)
    end

    def display(comment,user_instance)
        comment_table = TTY::Table.new ["Comment :", "By:"],[
        [comment.content, user_instance.user_name]]
        
        puts comment_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1])
        self.users_next_joke(user_instance)
    end
end