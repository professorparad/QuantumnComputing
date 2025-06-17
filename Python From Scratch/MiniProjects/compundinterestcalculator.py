try:
 principle = float(input('Enter the principle amount: '))
 rate = float(input('Enter the rate of interest: '))
 time = float(input('Enter the time (in years): '))
except NameError:
       print("Enter a number without special characters and strings.")

amount = principle * pow((1 + rate / 100), time)
compound_interest = amount - principle

print(f"The compound interest is: {compound_interest:.2f}")
print(f"The total amount after interest is ${amount:.2f}")