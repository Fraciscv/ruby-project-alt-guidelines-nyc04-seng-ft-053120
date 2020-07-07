
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

        if answer == "Login"
           loyal_user = User.log_someone_in
           loyal_user.display_profile
        elsif answer == "Register"
            new_user = User.create_a_new_user
        end
    end

    def self.bmo
        system ('clear')
        Main.welcome 
    end
    def display_user_info
        binding.pry
        loyal_user.display_profile
    end

            
end

