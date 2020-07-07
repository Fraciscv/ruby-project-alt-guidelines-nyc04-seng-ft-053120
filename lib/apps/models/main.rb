
class Main
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def self.welcome
                puts ' 
                    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                                
                    ░░░░▄██████████████████████▄░░░░                                 
                    ░░░░█░░░░░░░░░░░░░░░░░░░░░░█░░░░                           
                    ░░░░█░▄██████████████████▄░█░░░░                                                         
                    ░░░░█░█░░░░░░░░░░░░░░░░░░█░█░░░░                            
                    ░░░░█░█░░░░░░░░░░░░░░░░░░█░█░░░░                        
                    ░░░░█░█░░█░░░░░░░░░░░░█░░█░█░░░░                
                    ░░░░█░█░░░░░▄▄▄▄▄▄▄▄░░░░░█░█░░░░                        
                    ░░░░█░█░░░░░▀▄░░░░▄▀░░░░░█░█░░░░                    
                    ░░░░█░█░░░░░░░▀▀▀▀░░░░░░░█░█░░░░                        
                    ░░░░█░█░░░░░░░░░░░░░░░░░░█░█░░░░                    
                    ░█▌░█░▀██████████████████▀░█░▐█░                        
                     _       _    _                  _       _    _               
                    / /\    / /\ /\_\               / /\    / /\ /\_\             
                   / / /   / / // / /         _    / / /   / / // / /         _   
                  / /_/   / / / \ \ \__      /\_\ / /_/   / / / \ \ \__      /\_\ 
                 / /\ \__/ / /   \ \___\    / / // /\ \__/ / /   \ \___\    / / / 
                / /\ \___\/ /     \__  /   / / // /\ \___\/ /     \__  /   / / /  
               / / /\/___/ /      / / /   / / // / /\/___/ /      / / /   / / /   
              / / /   / / /      / / /   / / // / /   / / /      / / /   / / /    
             / / /   / / /      / / /___/ / // / /   / / /      / / /___/ / /     
            / / /   / / /      / / /____\/ // / /   / / /      / / /____\/ /      
            \/_/    \/_/       \/_________/ \/_/    \/_/       \/_________/       
                                                                            
        ============================== a Netaly and Francisco production
                    ░░░░░░░░██░░░░░░░░░░░░██░░░░░░░░
                    ░░░░░░░░██░░░░░░░░░░░░██░░░░░░░░
                    ░░░░░░░░██░░░░░░░░░░░░██░░░░░░░░
                    ░░░░░░░▐██░░░░░░░░░░░░██▌░░░░░░░
                    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
                    
                    Welcome to our application!
        '.blue.on_yellow
        # font = TTY::Font.new(:block)
        # puts font.write("Welcome" "to\n" "our" "application", letter_spacing: 2)

    end

    def login_register_prompt
        answer = prompt.select("Are you logging in or registering?", [
            "Login",
            "Register"
        ])
        user_instance = []
        # user_instance = []
        if answer == "Login"
           user = User.log_someone_in
            user_instance << user
    
        elsif answer == "Register"
            user = User.create_a_new_user
            # user_instance << 
            user.display_profile
            user_instance << user
        end
        # user_instance[0]
        user_instance[0]
    
    end

    def self.bmo
        system ('clear')
        Main.welcome 
    end

    def users_interface(user_instance)
        
        activity_options = [
            "Looking for Mischief",
            "Looking to update",
            "Seeking Knowledge",
            "                                                                                           "
        ]
        user_input = prompt.select("What are you looking for today?",activity_options )

        case user_input   
        when "Looking for Mischief" 
            #joke_method
            puts 'joke jokes jokes'
        when "Looking to update"
            #profile_edit
            puts '~~~~~You have choosen to "Pimp my Profile"~~~~'.blue.on_yellow
            
            User.edit_my_profile(user_instance)
            puts "it didnt run"
         
        when "Seeking Knowledge"
            #lesson_review
            Lesson.lesson_interface
        else
            #bmo_dance_party
            puts 'my name is BMO! nice to meet you!'
        end

    end

            
end

