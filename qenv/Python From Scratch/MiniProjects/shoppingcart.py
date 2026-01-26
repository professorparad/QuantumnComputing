# ok this is a shopping cart program where we will use the concept of lists 
foods = []
prices = []
total = 0 
while True :
    food = input(f"Enter the food that you ordered (press q to quit) ")
    if food == "q":
        break 
    else:
        price = float(input("Enter the price of each food"))
        foods.append(food)
        prices.append(price)
for food in foods :
  print(f"{ food :^10}")
for price in prices :
  total = total + price 
print(f"Your total is {total} ")

