
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
    end

    def login_register_prompt
        answer = prompt.select("Are you logging in or registering?", [
            "Login",
            "Register"
        ])
        # user_instance = []
        if answer == "Login"
           user = User.log_someone_in
        #    user_instance << 
            #user.display_profile
        elsif answer == "Register"
            user = User.create_a_new_user
            # user_instance << 
            user.display_profile
            
        end
        # user_instance[0]
        # user.display_profile
    end

    def self.bmo
        system ('clear')
        Main.welcome 
    end

    def users_interface
        activity_options = [
            "Looking for Mischeif",
            "Looking to update",
            "Seeking Knowledge",
            "                                                                                             "
        ]
        user_input = prompt.select("What are you looking for today?",activity_options )

    end

            
end

