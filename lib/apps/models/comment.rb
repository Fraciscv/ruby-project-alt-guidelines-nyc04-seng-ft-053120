class Comment < ActiveRecord::Base
    belongs_to :joke
    belongs_to :user
    belongs_to :lesson

    # def find_appropiate_comment(lesson_or_joke_instance)
    #     Comment.all.find_by(comment_id:)
    #     if lesson_or_joke_instance.class == Lesson
    #         found_comment = Comment.all.find_by(lesson_id: lesson_or_joke_instance.id)
    #         found_comment.
    #     else lesson_or_joke_instance.class == Joke 
    #         found_comment = Comment.all.find_by(joke_id: lesson_or_joke_instance.id)
            
    #     end



    # end

    # def self.comment_table(instance_of_comment)
    #         user_table = TTY::Table.new ['Comment', lesson_or_joke_instance.comment_id ], [
    #             ['Author:', lesson_or_joke_instance.user_id ,"likes", ],["", comment.content]]
    #         puts user_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )
        
    # end
end

