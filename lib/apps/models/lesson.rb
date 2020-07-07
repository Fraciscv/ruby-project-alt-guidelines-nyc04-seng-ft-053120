class Lesson < ActiveRecord::Base
    has_many :likes, through: :users
    has_many :comments, through: :users
    attr_accessor :prompt, :lesson

    def initialize
        @prompt = TTY::Prompt.new
    end

    def self.lesson_interface
        prompt = TTY::Prompt.new
        Main.bmo
        interface = prompt.select("Welcome to Lessons, what would you like to do?", [
            "Search Lesson",
            "Main Menu"
        ])
        if interface == "Search Lesson"
            lesson = self.search_lesson
         #    user_instance << 
             #user.display_profile
         elsif interface == "Main Menu"
            main_interface.users_interface
         end
    
    end

     def self.search_lesson
        prompt = TTY::Prompt.new
        Main.bmo
        
        lessons = Lesson.all.map {|m| m.title}.flatten
        prompt.select('Choose a lesson?', lessons, filter: true)
     end

    # def comment_lesson
    # end

    # def edit_comment
        
    # end
end