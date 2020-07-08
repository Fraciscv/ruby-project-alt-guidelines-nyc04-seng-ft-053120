class Lesson < ActiveRecord::Base
    has_many :likes, through: :users
    has_many :comments, through: :users
    attr_accessor :prompt, :lesson

    def self.lesson_interface(user_instance)
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
        else interface == "Main Menu"
        Main.users_interface(self)
         end
    
    end

     def self.search_lesson
        prompt = TTY::Prompt.new
        Main.bmo
        
        lessons = Lesson.all.map {|m| m.title}.flatten
        binding.pr

        lesson_name = prompt.select('Choose a lesson?', lessons, filter: true)
        Lesson.all.find_by(title: lesson_name).display_lesson
     end

     def display_lesson 
        user_table = TTY::Table.new ['Lesson Name', self.title ], [
            ['Summary:', self.summary]]
        puts user_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )
    
     end

    # def comment_lesson
    # end

    # def edit_comment
        
    # end
end