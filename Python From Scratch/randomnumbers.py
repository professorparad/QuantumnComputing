import random 
#number = random.randint(1 , 10)
#print (random.random())
#lower = 12
#higher = 20
#number = random.randint(lower , higher)
#print(number)
tossgame = ["Heads", "Tails"]
choice = random.choice(tossgame)
#print(choice)
cards =["2" , "3" , "4", "5" , "6 " , "7", " 8" , "9" , "10" , "J" , "Q" , "K" , "A"]
random.shuffle(cards)
print (cards)
