class User < ActiveRecord::Base
    has_many :comments, through: :jokes
    has_many :minions
    has_many :like

    def self.make_a_new_user
        # creates a new instance of tty to be used in the program
        prompt = TTY::Prompt.new
        # user_name will now old the value of users input
        users_name = self.check_for_user_duplicates
        user_password = self.password_check
        User.create(user_name:users_name, password:user_password)
    end

    def self.check_for_user_duplicates
        prompt = TTY::Prompt.new
        user_created = prompt.ask("What will be your username?")
        
            if User.find_by(user_name: user_created)
                puts "Sorry mate looks like thats taken!!"
                self.check_for_user_duplicates
               
            else
                user_created
            end
    end

    def self.password_check
        prompt = TTY::Prompt.new
        user_pass = prompt.mask("type your password: ")
        compare_pass = prompt.mask("type your password again: ")
        if user_pass == compare_pass
            puts "nice"
        else
            puts "~~~EROR Passwords do not match, try again.~~~"
            self.password_check
        end
        user_pass
    end
end