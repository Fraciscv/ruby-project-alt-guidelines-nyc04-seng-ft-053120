
class Main
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    # def welcome
    #     system('clear')
    #     window_l = ENV['COLUMNS'].to_i
    #     window_h = ENV['LINES'].to_i

    #     padding = (""*window_l).colorize(:background => :black)
    #     color_moon = {:color => :light_yellow, :background => :black}
    #     color_logo = {:color => :light_blue, :background => :black}
    #     small_art = [
    #         padding,
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         moon_logo1 ="a".center(window_l).colorize(color_logo),
    #         padding
    #     ]
    #     if window_l > 0 && window_l < 106
    #         small_art.each{|x| puts x}
    #     else
    #         puts "didn't work"
    #     end
    #     ((ENV['LINES'].to_i-2)/2-9).times do puts (" ")*window_l).colorize(:color => :light_yellow, :background => :black) end
    # end
    def welcome
        p "WELCOME".colorize(:blue)

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

'.blue.on_yellow


    end



    def login_register_prompt
       user_response = prompt.select("Login in OR Register.",["login", "Register"])
       
       if user_response == "Register"
           puts "~~~lets sign you up!!~~~"
        #    create a method that creates a new users and prompts user for information on signing up
        # prompt for username/password
        # name
           User.make_a_new_user
       elsif user_response == "login"
        # needs a method that will look for the user in data base by 
        # askign for username and pasword 
        # if this matches let them "in"
           puts "~~Nice to see you again!!~~~"
        #    calls a method that locats user
           puts "find user"
       end
    end

end