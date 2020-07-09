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
            binding.pry
            newmain.users_interface(user_instance)
         end
    
    end

     def self.search_lesson(user_instance)
        prompt = TTY::Prompt.new
        Main.bmo
        
            lessons = Lesson.all.map do |m|
                 m.title
            end.flatten
        lesson_name = prompt.select('Choose a lesson?', lessons, filter: true)
        lesson_found = Lesson.all.find_by(title: lesson_name)
        
        Main.bmo
        
        find_comment = self.find_comment(lesson_found)
        
        lesson_found.print_comments
        lesson_found.what_now(user_instance)

     end

    def print_comments
        Lesson.find_comment(self).each do |m|
             self.display_lesson(m) 
            end
    end

    def self.find_comment(lesson_a)
        found = Comment.all.select do |m|
            m.lesson_id == lesson_a.id
        end
      found
    end

     def display_lesson(comment) 
        user_table = TTY::Table.new ['Lesson Name', self.title], [
            ['Summary:', self.summary ],['comment:', comment.content ]]
        puts user_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )
     end

     def what_now(user_instance)
        prompt = TTY::Prompt.new
        what_next = prompt.select("To Do", [
            "Write Review",
            "Main Menu"
        ])
        
            
        case what_next
        when "Write Review"
            comment = prompt.ask('content:')
            new_comment = Comment.create(content: comment, lesson_id: self.id)
            self.display_lesson(new_comment)
            puts "Your review is being submitted,".green.blink 
            sleep(3)
            puts "redirecting you to lesson main page.".yellow.blink
            sleep(3)
            puts "this message will self distruct in 10 seconds".red.blink
            sleep(10)
            Lesson.lesson_interface(user_instance)
        when "Main Menu"
            Main.bmo
            newmain = Main.new()
            newmain.users_interface(user_instance)

        end
    end

end