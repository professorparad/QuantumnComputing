# So here in this small mini  project we will tka e the user input and check whether 
# the user name is 12 , 8 characters long 
# if they have any spaces or not 
# if the have any special characters or not 
# if they have any number or not 
# if they have any capital letters or not 
username = input("Enter your username :")
if len(username)<=12 or len(username) <= 8 :
     print ("The user name should atleast 12 or 8 characters long")
     if " " in username :
         print(" the user should not contain any spaces")
     if username.isalpha() == False:
         print("The user name should not contain any special characters")
     if not any(char.isdigit() for char in username):
         print("The username should contain atleast 1 number")
     if not any(char.isupper() for char in username):
         print("The username should contain atleast 1 capital letter")
else:
    print("The username is valid")
    print("Welcome", username)
# The code checks the username for various conditions and prints appropriate messages.
