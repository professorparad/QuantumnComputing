questions = ("How many planets are there in a solar system" , "What is the unit of resistance " , "What is the unit of power " , "What do you call the study of plutonic solids in mathematics" )
options =  (("A.9" , "B.10", "C.11","D.8"), ("A. Ohm " , "B. Lamda" , "C. mho" , "D.Candella") , ("A. Newton " , "B. KG" , "C. Watt" , "D. Ampere") , ("A. Geomatry " , "B. Topology" , "C. Trigonometry " , "D. Calculus"))
guesses = []
answers = ('A' , 'A' , 'C' , 'B')
question_number = 0
score = 0 
answerlength = int(len(answers))
for question in questions :
   print("--------------------------------------------------------------")
   print(question)
   print("--------------------------------------------------------------")
   for option in options[question_number]:
        print(option)
   guess = input("Enter the options which is correct").upper()
   guesses.append(guess)
   if guess == answers[question_number]:
       print(f"The answer is correct !!")
       score +=1
   else :
       print (f"The answer is incorrect the correct answer is {answers[question_number]}")
   question_number += 1

print("-----------------------------------")
print("              RESULTS              ")
print("-----------------------------------")

print(f"The guess you have guessed is {guesses}")
print (f"The Answers are {answers}")
total = (score / answerlength) * 100
print(f"The Total points you wil get is {total}%")
      