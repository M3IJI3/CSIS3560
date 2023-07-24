import csv 

cfile = open('week08/fruit.csv')
fReader = csv.reader(cfile)
fData = list(fReader)
print(fData)
cfile.close()

# read using with 
with open('week08/fruit.csv') as cfile:
    fReader = csv.reader(cfile)
    for row in fReader:
        print("Row ", str(fReader.line_num), ', ', str(row).strip())