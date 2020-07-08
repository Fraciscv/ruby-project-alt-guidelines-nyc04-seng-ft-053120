class User < ActiveRecord::Base
    has_many :lessons, through: :comments
    has_many :minions
    has_many :like
    
    def self.check_user
        #Main.bmo
        random_usernames = [
            "PowerpuffGirl279", "WedgeBiggs007", "AlveeRules", "YogaPosePretzel", "NoForksGiven","KanyeForPresident","CoffeeDaddy", "HobbitFeet429", "Mordor69", "Raffyisbae", "CharmanderCHARBOK", "TeenageMutantNinjaSquirtles", "Raffyisagoodboy", "RaffyAteMyLab", "ChuckNorrisLover"].sample
        prompt = TTY::Prompt.new
        username = prompt.ask("What would you like your username to be?")
        if User.find_by(user_name: username)
            puts "~~~~~~Sorry that user name was taken, how about you try: #{random_usernames}~~~~~"
            self.check_user
        else
            username
        end
    end

    def self.bmo_come_back
        Main.welcome
        system 'clear'
    end
     
    def self.log_someone_in
        #Main.bmo
        prompt = TTY::Prompt.new
        username = prompt.ask("what is your username?")
        pass = self.password_prompt
            if User.find_by(user_name: username) && User.find_by(password: pass)
                
                user_instance = User.find_by(user_name: username)
                user_instance.status = "Online".green.on_black.blink
                Main.bmo
                puts "~~~~Welcome back #{username} today is #{Time.now}~~~~~ " 
                
                user_instance.display_profile
                user_instance
            else
                puts "~~~your username or password are incorrect.~~~"
                self.log_someone_in

            end
    end

    def self.create_a_new_user
        #
        prompt = TTY::Prompt.new
        username = self.check_user
        pass = self.password_prompt
        cohort = prompt.select("What Cohort do you belong to", [
            "Pryñatas",
            "404's", 
            "The Git Up",
            "NOLB",
            "The Go Gitters",
            "French Pry Cult"
        ])
        
        new_user = User.create(user_name: username, password: pass, cohort: cohort, member_since: Time.now, status:"Online")
    
        Main.bmo
        self.welcome_sign(new_user)
        new_user
    end

    def self.welcome_sign(user_instance)
        puts "                           ~~~~  Welcome #{user_instance.user_name},  ~~~~                                       ".yellow.on_black     
        puts "                     Your password is >>>#{user_instance.password}<<< don't lose it,                             ".black.on_yellow.blink
        puts "                         because we have no way of retrieving it for you... <3                                   ".yellow.on_black
        puts "                       OH!! and ummm, you now belong to us. #{user_instance.cohort}                              ".black.on_yellow.blink

    end  

    def self.password_prompt
        prompt = TTY::Prompt.new
        password = prompt.mask("What is your password?") 
        if password.length < 4
            puts "Your password is not long enough, to party (minimum 4 character)"
            self.password_prompt
        else 
            password
        end

    end

    def display_profile   
        user_table = TTY::Table.new ['User Name','Name','Status','Cohort','Bio'], [
            [self.user_name, self.name, self.status,self.cohort, self.bio]]
        puts user_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )    
    end

    def self.edit_my_profile(user_instance)
        prompt = TTY::Prompt.new 
        mutables = ["My Name", "Cohort", "Bio","Change Password", "Self-Destruct".colorize(:red)]
       users_choice = prompt.select("What would you like to change?",mutables)
       case users_choice 
       when "My Name"
        #   prompt and change name
        user_instance.prompt_for_users_name
       when "Cohort"
        #    prompt_for_cohort
        user_instance.prompt_for_cohort
       when "Bio"
        # prompt for input
        user_instance.prompt_for_bio
       when "Change Password"
        user_instance.prompt_for_pass
       else
        #    this should prompt if they are sure
        # then delte their row in the database
        user_instance.begin_self_destruct
       end
    end

    def prompt_for_users_name
        prompt = TTY::Prompt.new 
        users_input = prompt.ask("Well what would like to be called?")
        puts "Congrats Your Name Is Now #{users_input}"
        self.update_and_display(name: users_input)   
    end

    def prompt_for_cohort
        
        prompt = TTY::Prompt.new 
        prompt.yes?("Are you betraying your cohort? You can answer honestly... I won't judge. ;D ")
        cohort = prompt.select("What Cohort do you belong to", 
        [
            "Pryñatas",
            "404's", 
            "The Git Up",
            "NOLB",
            "The Go Gitters",
            "French Pry Cult"
        ])
        puts "Well then, You now belong to the #{cohort}"
        self.update_and_display(cohort: cohort)
        
    end

    def update_and_display(hash)
        self.update(hash)
        Main.bmo
        self.display_profile
    end

    def prompt_for_bio
        prompt = TTY::Prompt.new 
        new_bio = prompt.ask("Type it up what's your story?")
        self.update_and_display(bio: new_bio)
    end

    def begin_self_destruct
        system('cls')
        count = 0
        prompt = TTY::Prompt.new 
        response = prompt.yes?("Are you sure you want to delete your data?")
        if response == true
            puts "Loading your data"
            while count < 3 do
            
                         puts  "@@@@@@@@@@@@@@@@@@(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@/@@@@@@@@@&.     ./%@@@@@%*.&@@@@@@@@@@@@@@@@@@(@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@%@@@@     ,@@@@@@@@@@@@@@@@@@@@@%#@@@@@@@@@@@@@&@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@@,     &@@@/  ./@@@@@@@@@@@@@@@@@@        @@@@&@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@      @@.      @@@@@(@@@@@@@@@@@@      %@@@@@&@(@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@.     %@(       (@@@@@@%@@@@@@@@@@       (@@@@@@&@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@      @@@         #@@@@@@#@@@@@@@@@.        ,@@& /@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@      &@@@                @@@@@@@@&@@*            &@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@      /@@@@@/             @@@@@@@#%%%%%%%%%%%%%%%#,.@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@/      @@@@@@@@@(       &@@@@@@@@@ *((((((((/*,&@@@@, @@@@@@@@@@@@@@@@
                                @@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. .@@@@@@@@@@@@@@@
                                @@@@@@@@@@%      *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@
                                @@@@@@@@@@.      (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   &@@@@@@@@@@@@@@
                                @@@@@@@@@@       (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#   /@@@@@@@@@@@@@@
                                @@@@@@@@@@       /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@
                                @@@@@@@@@%       *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@
                                @@@@@@@@@#       .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@@@@@@@@@@@@
                                @@@@@@@@@,        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(      @@@@@@@@@@@@@@
                                @@@@@@@@@,        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@@
                                @@@@@@@@@,         &@@@@@@@@/*@@@@@@@@@@@@@@@@@@@      .          @@@@@@@@@@@@@@
                                @@@@@@@@@.           @@@@@     &@@@@@@@@@@@@@@@@&                 @@@@@@@@@@@@@@
                                @@@@@@@@@.                     @@@@@@@@@@@@@@@@@@&                &@@@@@@@@@@@@@
                                @@@@@@@@(                     ##%%%#(/***,,.**//((.(*((#%*&&&&&&/...   .@@@@@@@@
                                @@@@@ ......*@@@@/    @@@&    &@@&    @@@@@@#@@@@(    @@@     (@@@@@ ...... @@@@
                                @@ ...... &@@@@(    &@@@.    %&&&                       .....    ...    .. *,&& 
                                ........   .   ............ ****/###%%%%&&&&&&&&&&&&  .........   .  .    %&&&%&
                                                                                                         ####(,*
                                                                                                         ####/##
                                @@@@@@@@@@%       &@////,//,@@@@@@@@@@@@@@@@@@@@@&/,.//*,/.     @@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@/     *////////,@@@@@@@@@@@@@@@@@@@@@,////////.   @@@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@/  @*//////@@@@@@@@@@@@@@@@@@@@@@&///////,@@@@@@@@@@@@@@@@@@@@@@
                                &&&&&&&&&&&%%%%%%###(((//((((#(///*/////**//*///****...///(((((((((#%%%&&&&&&&&&".colorize(:red)
                                sleep(1)
                                system('cls')


                        Main.bmo

                          puts "@@@@@@@@@@@@@@@@@@(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@/@@@@@@@@@&.     ./%@@@@@%*.&@@@@@@@@@@@@@@@@@@(@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@%@@@@     ,@@@@@@@@@@@@@@@@@@@@@%#@@@@@@@@@@@@@&@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@@@,     &@@@/  ./@@@@@@@@@@@@@@@@@@        @@@@&@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@@      @@.      @@@@@(@@@@@@@@@@@@      %@@@@@&@(@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@.     %@(       (@@@@@@%@@@@@@@@@@       (@@@@@@&@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@      @@@         #@@@@@@#@@@@@@@@@.        ,@@& /@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@      &@@@                @@@@@@@@&@@*            &@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@      /@@@@@/             @@@@@@@#%%%%%%%%%%%%%%%#,.@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@/      @@@@@@@@@(       &@@@@@@@@@*((((((((/*,&@@@@, @@@@@@@@@@@@@@@@
                                @@@@@@@@@@@       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@. .@@@@@@@@@@@@@@@
                                @@@@@@@@@@%      *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@
                                @@@@@@@@@@.      (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   &@@@@@@@@@@@@@@
                                @@@@@@@@@@       (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#   /@@@@@@@@@@@@@@
                                @@@@@@@@@@       /@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@
                                @@@@@@@@@%       *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     @@@@@@@@@@@@@@
                                @@@@@@@@@#       .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@@@@@@@@@@@@
                                @@@@@@@@@,        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(      @@@@@@@@@@@@@@
                                @@@@@@@@@,        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@@
                                @@@@@@@@@,         &@@@@@@@@/*@@@@@@@@@@@@@@@@@@@      .          @@@@@@@@@@@@@@
                                @@@@@@@@@.           @@@@@     &@@@@@@@@@@@@@@@@&                 @@@@@@@@@@@@@@
                                @@@@@@@@@.                     @@@@@@@@@@@@@@@@@@&                &@@@@@@@@@@@@@
                                @@@@@@@@(                     ##%%%#(/***,,.**//((.(*((#%*&&&&&&/...   .@@@@@@@@
                                @@@@@ ......*@@@@/    @@@&    &@@&    @@@@@@#@@@@(    @@@     (@@@@@ ...... @@@@
                                @@ ...... &@@@@(    &@@@.    %&&&                       .....    ...    .. *,&& 
                                ........   .   ............ ****/###%%%%&&&&&&&&&&&&  .........   .  .    %&&&%&
                                                                                                         ####(,*
                                                                                                         ####/##
                                @@@@@@@@@@%       &@////,//,@@@@@@@@@@@@@@@@@@@@@&/,.//*,/.     @@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@/     *////////,@@@@@@@@@@@@@@@@@@@@@,////////.   @@@@@@@@@@@@@@@@@@
                                @@@@@@@@@@@@@@@@/  @*//////@@@@@@@@@@@@@@@@@@@@@@&///////,@@@@@@@@@@@@@@@@@@@@@@
                                &&&&&&&&&&&%%%%%%###(((//((((#(///*/////**//*///****...///(((((((((#%%%&&&&&&&&&"

                                sleep(1)

            count +=1
            end
            self.destroy(self.id)
           
            puts "You are now removed."
        else
            puts "I see you've changed your mind <3"
            # calls a main method that accepts the users info and displays the table
            sleep(1)
            user.display_profile
        end
        binding.pry

    end


end