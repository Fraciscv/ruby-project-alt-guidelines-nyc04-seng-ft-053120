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

            lesson = self.search_lesson(user_instance)
         #    user_instance << 
             #user.display_profile
        else interface == "Main Menu"
            newmain = Main.new()
            newmain.users_interface(user_instance)
         end
    
    end

     def self.search_lesson(user_instance)
        prompt = TTY::Prompt.new
        Main.bmo
        
        lessons = Lesson.all.map {|m| m.title}.flatten

        lesson_name = prompt.select('Choose a lesson?', lessons, filter: true)
        lesson_found = Lesson.all.find_by(title: lesson_name)
        Main.bmo
        find_comment = Comment.all.find_by(lesson_id: lesson_found.id)
        binding.pry
        

        lesson_found.display_lesson(find_comment)
        
     end

     def display_lesson(comment) 
        user_table = TTY::Table.new ['Lesson Name', self.title ], [
            ['Summary:', self.summary ],['comment:', comment.content]]
        puts user_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )
    
     end

     def comment_lesson(user_instance)
        prompt = TTY::Prompt.new
        
     end

    # def edit_comment
        
    # end
end