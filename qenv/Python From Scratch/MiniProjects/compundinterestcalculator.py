
principle = float(input("Enter your priciple amount : "))
rate = float(input("Enter your rate :  "))
time = float(input("Enter your time in years : "))


amount = principle * pow((1 + rate/ 100 ), time)
print(f"the amount after compounding is ${amount : .2f}")
