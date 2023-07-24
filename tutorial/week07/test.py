mylist=[x**2 for x in range(10)]
print(mylist)

num=[1,2,3,-1]
mylist=[x for x in num if x > 1]
print(mylist)

myConfig = {"host":"localhost"}
print(myConfig["host"])

for k in myConfig.keys():
    print(k)

for k,v in myConfig.items():
    print(k,v)

