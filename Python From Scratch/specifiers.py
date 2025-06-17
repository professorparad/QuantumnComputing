a = 100000000.5890
print (f"The price is {a:.2f} ") # the price of the item is rounded of to 2 decimal places
print (f"the price is {a : 10}")# gives spaces
print (f"the price is {a:010}")# gives and fills the spaces with 0
print (f"the price is {a:<10}")# left aligned
print (f"the price is {a:>10}")# right aligned
print (f"the price is {a:^10}")# center aligned
print (f"the price is {a:,.2f}") # the price of the item is rounded of to 2 decimal places and padded with spaces
print (f"the price is {a:,}")# gives the comas depending upon the international standard 
## Format Specifers are nothing but styling options that we use in the print statement at the 
## the sysntx of the format specifers is print(f"The value or whatever we want to print {value: format specifer }")