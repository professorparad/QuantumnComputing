import time 
mytime = int(input("Enter the time in seconds for your alarm"))

for x in  range(mytime , 0 , -1):
    seconds = x % 60 
    minutes = int((x * 60) % 60 )
    hours = int(x / 3600 )
    print (f"{hours :02}:{minutes :02}:{seconds:02}")
    time.sleep(1)
print("Times Up !!")