
class Main
    attr_accessor :prompt, :user, :joke, :lesson

    def initialize
        @prompt = TTY::Prompt.new(active_color: :yellow)
    end

    def self.welcome
        puts '              
        
                                                         
                                          _       _    _                         _       _    _               .
                        .               / /\    / /\ /\_\           ✨         / /\    / /\ /\_\             
                                       / / /   / / // / / *       _      .   / / / * / / // / /         _   
                      *               / /_/   / / / \ \ \__      /\_\       / /_/   / / / \ \ \__   *  /\_\           🪐
                                     / /\ \__/ / /   \ \___\    / / /      / /\ \__/ / /   \ \___\    / / / 
                               *    / /\ \___\/ /     \__  /   / / /      / /\ \___\/ /     \__  /   / / /  .
           .             ☄️         / / /\/___/ /      / / /   / / /      / / /\/___/ /      / / /   / / /   
                                  / / /   / / /      / / /   / / /   *  / / /   / / /    ✨/ / /   / / /    
                                 / / /   / / /   🚀 / / /___/ / /      / / /   / / /      / / /___/ / /           .
         💫                      / / /   / / /     / / /____\/ /      / / /   / / /  *   / / /____\/ /   *                              
                *               \/_/    \/_/       \/_________/       \/_/    \/_/       \/_________/                                  
                                            .                                  .'.light_yellow   
    puts '                                                                              Version  2.4.3'.blue

    sleep(0.25)                                                                        
       puts '                        ============================== a Netaly and Francisco production ==========                    '.white
    sleep(0.20)   
       puts '                           ==============================  🧙🏼‍♂️Welcome to our application!🧝🏽‍♂️=================                      
       
       
       ____^/\___^--____/\____O______________/\/\---/\___________---__________________/\/\---/\___________---___________________
       /\^   ^  ^    ^                  ^^ ^                                       ^          ^       --- 
             --           -            --  -      -         ---  __       ^              --  -      -         ---  __    
       --  __                      ___--  ^  ^                         --  __    ^                        --  __   
                 -            --  -      -         ---  __   __       ^              --  -     __       ^              --  -  
     
    '.blue
                                                    
        # font = TTY::Font.new(:block)
        # puts font.write("Welcome" "to\n" "our" "application", letter_spacing: 2)

    end

    def login_register_prompt
        answer = prompt.select(" .:.:.:.:.:.:.:.:.:.::.:.:.:.:.:🧙🏼‍♂️🧝🏽‍♂️Are you logging in or registering?:.:.:.:.:.::.:.:.:.:.::.:.:.:.:.: ".light_yellow, [
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
            "Looking for mischief",
            "Alter profile",
            "Drink from the cup of knowledge",
            "Support",
            "EXIT" ,
            "                   "
        ]
        user_input = prompt.select(":.:.:.:.:.: 🧙🏼‍♂️🧝🏽‍♂️What are you looking for today?:.:.:.:.:.:",activity_options )

        case user_input   
        when "Looking for mischief" 
            #joke_method
            puts 'joke jokes jokes' 
            Joke.joke_interface(user_instance)
            Main.bmo
            user.display_profile
        when "Alter profile"
            #profile_edit
            puts '        ~~~                       ~~~~~🧙🏼‍♂️🧝🏽‍♂️You have choosen to "Pimp your Profile"~~~~                       ~~~~'.light_yellow
            
            User.edit_my_profile(user_instance)
            Main.bmo
            user.display_profile
        when "Drink from the cup of knowledge"
            #lesson_review
            Lesson.lesson_interface(user_instance)   
        when "Support"
            puts "Please make donations to the following wallets to Support us.
                  BTC : bc1qlt2qpyhw8nfel87mm654hyj2wq97afe786ymss
                  ETH : 0xE710EE81e8ACefd8760CCb75615Af16076713E5c
                  ADA : Ae2tdPwUPEZ6eRzNB8p6145WGkAYzQATJit56DXhR26iFU4rik7xzMHmAvW"
                  sleep(10)
            puts "Thank you!"
                  sleep(3)
                  self.new_user 
        when "EXIT"
           self.new_user   
        else
            spinner = TTY::Spinner.new("[:spinner] Hacking the Gibson ...", format: :pulse_2)
            spinner.auto_spin # Automatic animation with default interval
            sleep(5) # Perform task
            spinner.stop("Step 1. type 'User.all' to hack the Gibson Step 2. type 'q' then 'exit' to kill the worm.").light_red.blink # Stop animation
            binding.pry
            #bmo_dance_party
            puts "You Hacked the Gibson!".light_red.blink
            self.new_user 
        end
        # user.display_profile
    end

    def new_user
       
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

