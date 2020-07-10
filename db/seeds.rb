 User.destroy_all
 Comment.destroy_all
 Joke.destroy_all
 Lesson.destroy_all
 Like.destroy_all
 Minion.destroy_all

#create users
#name, user_name, age, bio, cohort, member_since, password, num_of_minion_followed, minion_d, status
netaly = User.create(user_name: "Nutella", name: "Netaly Ramirez"  ,password: "1234")
francisco = User.create(user_name: "Zerocool", name: "Francisco Andaur" ,password: "asdf")
tricia = User.create(user_name: "Patricia456", name: "Patricia Anderson" ,password: "qwer")
manon = User.create(user_name: "Manon234", name: "Manon De La Huerta" ,password: "1234567890")
donat = User.create(user_name: "Donut", name: "Donat Depp" ,password: "1234567890")
barbara = User.create(user_name: "Barbi", name: "Barbara Montenegro" ,password: "1234567890")
karem = User.create(user_name: "Teflon", name: "Karem Johanson" ,password: "1234567890")



#create jokes
#content, genre, like_id
ja = Joke.create(content: "Welcome to 2020 where every mmonth is a level in Jumanji", genre: "Pop Culture")
jb = Joke.create(content: "The year 2020 could be said to have been written by George RR Martin.", genre: "Pop Culture")
jc = Joke.create(content: "That moment when you are so broke putting money into your savings is when you put your cash in the other pocket", genre: "Pop Culture")
jd = Joke.create(content: "KaReEn", genre: "Pop Culture")
je = Joke.create(content: "Never trust an atom... they make up everything ", genre: "Pop Culture")
jf = Joke.create(content: "Parallel lines have so much in common.... its a shame they never meet.", genre: "Pop Culture")
joke1 = Joke.create(content: "Chuck Norris threw a grenade and killed 50 people, then it exploded.", genre: "Chuck Norris Fact")
joke2 = Joke.create(content: "An SQL query goes into a bar, walks up to two tables, and asks, “Can I join you?", genre: "Code: Joke")
joke3 = Joke.create(content: "Two bytes meet. The first byte asks, “Are you ill?”
The second byte replies, “No, just feeling a bit off.", genre: "Code: Joke")
joke4 = Joke.create(content: "When Chuck Norris is web surfing websites get the message “Warning: Internet Explorer has deemed this user to be malicious or dangerous. Proceed?", genre: "Chuck Norris Fact")
joke5 = Joke.create(content: "Chuck Norris writes code that optimizes itself.", genre: "Chuck Norris Fact")
joke6 = Joke.create(content: "All browsers support the hex definitions #chuck and #norris for the colors black and blue.", genre: "Chuck Norris Fact")
joke7 = Joke.create(content: "Chuck Norris’s beard can type 140 wpm.", genre: "Chuck Norris Fact")
joke8 = Joke.create(content: "Chuck Norris built the hospital he was born in.", genre: "Chuck Norris Fact")
joke9 = Joke.create(content: "Chuck Norris can speak braille.", genre: "Chuck Norris Fact")
joke10 = Joke.create(content: "Chuck Norris does not sleep. He waits.", genre: "Chuck Norris Fact")
joke11 = Joke.create(content: "Chuck Norris' tears cure cancer. Too bad he has never cried.", genre: "Chuck Norris Fact")
joke12 = Joke.create(content: "There is no theory of evolution just a list of creatures Chuck Norris allows to live.", genre: "Chuck Norris Fact")
joke13 = Joke.create(content: "TNT was originally developed by Chuck Norris to cure indigestion.", genre: "Chuck Norris Fact")
joke14 = Joke.create(content: "When Chuck Norris falls in water, Chuck Norris doesn't get wet. Water gets Chuck Norris.", genre: "Chuck Norris Fact")
joke15 = Joke.create(content: "When taking the SAT, write 'Chuck Norris' for every answer. You will score a 1600.", genre: "Chuck Norris Fact")
joke16 = Joke.create(content: "Chuck Norris ordered a Big Mac at Burger King, and got one.", genre: "Chuck Norris Fact")
joke17 = Joke.create(content: "Chuck Norris can slam a revolving door.", genre: "Chuck Norris Fact")
joke18 = Joke.create(content: "Chuck Norris can touch MC Hammer.", genre: "Chuck Norris Fact")
joke19 = Joke.create(content: "Chuck Norris was bitten by a cobra and after five days of excruciating pain... the cobra died.", genre: "Chuck Norris Fact")
joke20 = Joke.create(content: "One time, Chuck Norris went to Mars. That’s why there’s no sign of life there.", genre: "Chuck Norris Fact")
joke21 = Joke.create(content: "Chuck Norris has never had to put gas in his tank. All of his vehicles run on fear.", genre: "Chuck Norris Fact")
joke22 = Joke.create(content: "Chuck Norris is the reason Waldo is Hiding", genre: "Chuck Norris Fact")
joke23 = Joke.create(content: "Chuck Norris can never fill out an online form because he will never submit", genre: "Chuck Norris Fact")
joke24 = Joke.create(content: "Chuck Norris has never blinked in his entire life. Never.", genre: "Chuck Norris Fact")
joke25 = Joke.create(content: "Chuck Norris does not use spell check. If he happens to misspell a word, Oxford will change the spelling.", genre: "Chuck Norris Fact")
joke26 = Joke.create(content: "Chuck Norris counted to infinity… twice.", genre: "Chuck Norris Fact")
joke27 = Joke.create(content: "Chuck Norris once won a game of Connect Four in three moves.", genre: "Chuck Norris Fact")
joke28 = Joke.create(content: "Chuck Norris can kill two stones with one bird.", genre: "Chuck Norris Fact")
joke29 = Joke.create(content: "When Chuck Norris does a pushup, he’s pushing the Earth down.", genre: "Chuck Norris Fact")
joke30 = Joke.create(content: "Chuck Norris makes onions cry.", genre: "Chuck Norris Fact")
joke31 = Joke.create(content: "Chuck Norris can drown a fish.", genre: "Chuck Norris Fact")
joke32 = Joke.create(content: "Chuck Norris once had a heart attack. His heart lost.", genre: "Chuck Norris Fact")
joke33 = Joke.create(content: "Outer space exists because it’s afraid to be on the same planet with Chuck Norris.", genre: "Chuck Norris Fact")
joke34 = Joke.create(content: "In Pamplona, Spain, the people may be running from the bulls, but the bulls are running from Chuck Norris.", genre: "Chuck Norris Fact")
joke35 = Joke.create(content: "Chuck Norris can divide by zero.", genre: "Chuck Norris Fact")

j1 = Joke.create(content: "A SQL query walks up to two tables in a restaurant and asks: 'Mind if i join you?'", genre: "Code: Joke")
j2 = Joke.create(content: "3 Database SQL walked into a noSQL bar they soon walk out.......... Because they couldn't find a table.", genre: "Code: Joke")
j3 = Joke.create(content: "99 bugs in the code, 99 bugs in the code! Take one down, patch it around. 127 bugs in the code.", genre: "Code: Joke")
j4 = Joke.create(content: "The only programming joke I know......... is my code", genre: "Code: Joke")
j5 = Joke.create(content: "Just keep calm, code on, and Blindly.Pray", genre: "Code: Joke")
j6 = Joke.create(content: "Debuggin is like being the detective in a crime movie where you're also the murderer.", genre: "Code: Joke")
j7 = Joke.create(content: "What's a computer's favorite beat?... An algo-rhythm.", genre: "Code: Joke")
j8 = Joke.create(content: "I hope your code behaves on Monday the same way it did on Friday.", genre: "Code: Joke")
j9 = Joke.create(content: "Hide and seek champion ':' since 1958 " , genre: "Code: Joke")
j0 = Joke.create(content: "The Hardest part of being a programmer, is naming variables.", genre: "Code: Joke")
j01 = Joke.create(content: "That moment when they tell you the error is on line 27 but it originated from line 234", genre: "Code: Joke")
j02 = Joke.create(content: "That moment when you try to look up a ruby enumerable and you get a bunny called MAX .", genre: "Code: Joke")
j03 = Joke.create(content: "There are 10 types of people in the world: those who understand binary, and those who don’t.", genre: "Code: Joke")
j04 = Joke.create(content:"If you have anything staged, commit now or stash forever", genre: "Code: Joke")
j05 = Joke.create(content:"I kissed a git, and I liked it. I hope my repo don't mind it.", genre: "Code: Joke")
j06 = Joke.create(content:"Nurture your git-twigs and they will grow into a full branch", genre: "Code: Joke")
j07 = Joke.create(content:"When you play the game of clones, you merge or you reset --hard.", genre: "Code: Joke")
j08 = Joke.create(content:"In case of fire: git commit, git push, leave the building", genre: "Code: Joke")
j09 = Joke.create(content:"Whats the object-oriented way to become wealthy?.. inheritance", genre: "Code: Joke")
j10 = Joke.create(content:"I never tell the same joke twice...I have a DRY sense of humor.", genre: "Code: Joke")
j11 = Joke.create(content:" Why don't bachelors like Git?... cause they are afraid to commit", genre: "Code: Joke")
j12 = Joke.create(content:"A programmer was arrested for writing unreadable code. They refused to comment.", genre: "Code: Joke")


#create lessons
#title, summary, location
l1 = Lesson.create(title: "Classes and Instances Lab",summary: "Instantiate instances of a class.")
l2 = Lesson.create(title: "Instance Methods Lab",summary: "Build instance methods for the class.")
l3 = Lesson.create(title: "Instance Variables",summary: "Describe how instance variables give objects attributes and properties.")
l4 = Lesson.create(title: "Object Initialization Lab",summary: "Set instance variable attributes from initialize.")
l5 = Lesson.create(title: "Object Attributes Lab",summary: "Create object properties using methods and instance variables")
l6 = Lesson.create(title: "Meowing Cat",summary: "Use macros to create setter and getter methods")
l7 = Lesson.create(title: "OO Email Parser",summary: "Practice defining a class and using an attr_accessor to create setter and getter methods")
l8 = Lesson.create(title: "OO Basics" ,summary: "This lab will walk you, step by step, through the basics of programming a simple Book class.")
l9 = Lesson.create(title: "OO School Domain" ,summary: "Define the concept of a domain model.")
l10 = Lesson.create(title: "OO Cash Register" ,summary: "Use instance methods to track information pertinent to an instance of a class.")
l11 = Lesson.create(title: "OO Counting Sentences" ,summary: "Learn about monkey patching." )
l12 = Lesson.create(title: "Class Variables and Methods Lab" ,summary: "Use class variables to keep track of data pertaining to a class.")
l13 = Lesson.create(title: "OO Basics with Class Constants" ,summary: "Know when to use attr_accessor VS creating the methods yourself")
l14 = Lesson.create(title: "OO Person Lab" ,summary: "Gain proficiency instantiating a class")
l15 = Lesson.create(title: "Advanced Class Methods Lab" ,summary: "Build custom class constructors.")
l16 = Lesson.create(title: "Puppy Lab" ,summary: "Write a class method to access the list of all instances of a class, stored in a class variable.")
l17 = Lesson.create(title: "Belongs to Object Lab" ,summary: "Write classes that are related via the 'belongs to' relationship.")
l18 = Lesson.create(title: "Has Many Object Lab" ,summary: "Build methods that use the has many/belongs to relationship between two classes.")
l19 = Lesson.create(title: "Collaborating Objects Lab" ,summary: "Build classes that interact with one another through associations and behavior.")
l20 = Lesson.create(title: "OO My Pets" ,summary: "Build classes that produce objects that interact with one another through associations and behavior.")
l21 = Lesson.create(title: "OO Banking" ,summary: "Use TDD to code two classes that interact with each other.")
l22 = Lesson.create(title: "Has Many Objects Through" ,summary: "Understand Has-Many-Through relationships")
l23 = Lesson.create(title: "Has Many Objects Through Lab" ,summary: "Write methods that use the 'has-many-through' relationship to deliver information on related objects.")
l24 = Lesson.create(title: "OO Kickstarter" ,summary: "Build classes that produce objects that relate to one another.")
l25 = Lesson.create(title: "Intro to Inheritance" ,summary: "Learn about inheritance in object oriented Ruby.")
l26 = Lesson.create(title: "Intro to Inheritance Lab" ,summary: "Define classes that inherit from a shared parent, or super, class.")
l27 = Lesson.create(title: "Intro to Modules" ,summary: "Learn about modules––another way to lend functionality across classes.")
l28 = Lesson.create(title: "Intro to Modules Lab" ,summary: "Recognize 'code smells' that indicate the need for refactoring.")
l29 = Lesson.create(title: "Super Lab" ,summary: "Define methods in the child class that use the super keyword to inherit from and augment methods in the parent class.")
l30 = Lesson.create(title: "Mass Assignment Lab" ,summary: "Use keyword arguments to define an initialize method.")


#create comments 
#user_id, joke_id, like_id, content, posted
comment1 = Comment.create(content: "This joke was super funny!", user_id:francisco.id, joke_id: j3.id)
comment2 = Comment.create(content: "This joke was lame!", user_id:netaly.id, joke_id: j2.id)
comment3 = Comment.create(content: "Amazing!!!!", user_id:donat.id, joke_id: j3.id)
comment4 = Comment.create(content: "I had trouble with this lab, but here is a link that helped me out google.com", user_id:tricia.id, lesson_id: l25.id)
comment5 = Comment.create(content: "nothing sticks, so i took a break", user_id:barbara.id, lesson_id: l9.id)
comment6 = Comment.create(content: "this joke was super good!", user_id:karem.id, joke_id: j2.id)
comment7 = Comment.create(content: "this joke was super!", user_id:manon.id, joke_id: j3.id)

#create likes
#user_id, comment_id, joke_id, like_counter
# likes1 = Like.create(like_counter: 20, joke_id: joke1.id)
# likes2 = Like.create(like_counter: 4, joke_id: joke2.id)
# likes3 = Like.create(like_counter: 2, joke_id: joke3.id)
# likes4 = Like.create(like_counter: 90, joke_id: joke4.id)
# likes5 = Like.create(like_counter: 30, joke_id: joke5.id)
# likes6 = Like.create(like_counter: 17, joke_id: joke6.id)
# likes7 = Like.create(like_counter: 500, joke_id: joke7.id)

#create minions
#user_id, minion_counter
# minion1 = Minion.create(user_id:francisco.id, minion_counter:99)
# minion2 = Minion.create(user_id:netaly.id, minion_counter:80982)
# minion3 = Minion.create(user_id:donat.id, minion_counter:89)
# minion4 = Minion.create(user_id:karem.id, minion_counter:9)
# minion5 = Minion.create(user_id:barbara.id, minion_counter:999)

puts "SEEDE YO!"