require_relative '../config/environment'

main_interface = Main.new()

# by calling the class method of welcome this stays while the rest can refresh
Main.welcome
# this below will call the remaining methods
user = main_interface.login_register_prompt
main_interface.user = user

#  Main.welcome
 main_interface.users_interface(user)



