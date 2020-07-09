
class Main
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def self.welcome
        puts '              
        
                                                         
                                          _       _    _                        _       _    _               
                                        / /\    / /\ /\_\                     / /\    / /\ /\_\             
                                       / / /   / / // / / *       _          / / / * / / // / /         _   
                      *               / /_/   / / / \ \ \__      /\_\       / /_/   / / / \ \ \__   *  /\_\ 
                                     / /\ \__/ / /   \ \___\    / / /      / /\ \__/ / /   \ \___\    / / / 
                               *    / /\ \___\/ /     \__  /   / / /      / /\ \___\/ /     \__  /   / / /  
                                   / / /\/___/ /      / / /   / / /      / / /\/___/ /      / / /   / / /   
                                  / / /   / / /      / / /   / / /   *  / / /   / / /      / / /   / / /    
                                 / / /   / / /      / / /___/ / /      / / /   / / /      / / /___/ / /     
                                / / /   / / /    * / / /____\/ /      / / /   / / /  *   / / /____\/ /   *                              
                *               \/_/    \/_/       \/_________/       \/_/    \/_/       \/_________/                               '.colorize(:yellow)    
                                                                                   puts 'Version  1.0.0                             '.colorize(:blue)

    sleep(0.25)                                                                        
       puts '                        ============================== a Netaly and Francisco production ==========                    '.white
    sleep(0.20)   
       puts '                      ============================== Welcome to our application!=================                      '.blue
                                                    
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
#clearn screen helper method
    def self.bmo
        system ('clear')
        Main.welcome 
    end

    def users_interface(user_instance)
        activity_options = [
            "Looking for Mischief",
            "Looking to update",
            "Seeking Knowledge", 
            "EXIT",
            "                   "
        ]
        user_input = prompt.select("What are you looking for today?",activity_options )

        case user_input   
        when "Looking for Mischief" 
            #joke_method
            puts 'joke jokes jokes'
            Main.bmo
            user.display_profile
        when "Looking to update"
            #profile_edit
            puts '~~~~~You have choosen to "Pimp my Profile"~~~~'.blue.on_yellow
            
            User.edit_my_profile(user_instance)
            Main.bmo
            user.display_profile
        when "Seeking Knowledge"
            #lesson_review
            Lesson.lesson_interface(user_instance)     
        when "EXIT"
           self.new_user   
        else
            spinner = TTY::Spinner.new("[:spinner] Hacking the Gibson ...", format: :pulse_2)
            spinner.auto_spin # Automatic animation with default interval
            sleep(5) # Perform task
            spinner.stop("Step 1. type 'User.all' to hack the Gibson \nStep 2. type 'q' then'exit' to kill the worm.") # Stop animation
            binding.pry
            #bmo_dance_party
            puts "You Hacked the Gibson!".red.blink
        end
        # user.display_profile
    end

    def new_user
        # by calling the class method of welcome this stays while the rest can refresh
        system ('clear')
        new_interface = Main.new()
        Main.welcome
        # this below will call the remaining methods
        usser = new_interface.login_register_prompt
        new_interface.user = usser

        #  Main.welcome
        new_interface.users_interface(usser)
    end
            
end

