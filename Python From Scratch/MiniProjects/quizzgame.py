questions = ("How many planets are there in a solar system" , "What is the unit of resistance " , "What is the unit of power " , "What do you call the study of plutonic solids in mathematics" )
options =  (("A.9" , "B.10", "C.11","D.8"), ("A. Ohm " , "B. Lamda" , "C. mho" , "D.Candella") , ("A. Newton " , "B. KG" , "C. Watt" , "D. Ampere") , ("A. Geomatry " , "B. Topology" , "C. Trigonometry " , "D. Calculus"))
guesses = []
answers = ('A' , 'C' , 'A' , 'D')
question_number = 0
score = 0 

for question in questions :
   print("--------------------------------------------------------------")
   print(question)
   print("--------------------------------------------------------------")
   for option in options[question_number]:
        print(option)
        guess = input("Enter the options")
        guesses.append(guess)
        if guess == answers[question_number]:
            print ("The answer is correct !!")
            score +=1 
        else :
            print (f"The Answer is incorrect !!. The corrct answer is {answers[ question_number]}")

            
   
   question_number += 1
print(f"The guess you have guessed is {guesses}")
print (f"The Answers are {answers}")
total = score / len(score) * 100
print(f"The Total points you wil get is {total}%")
      