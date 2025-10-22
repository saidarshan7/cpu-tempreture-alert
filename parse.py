import json

with open('data.txt','r') as file:
    data = file.read()


data1 = json.loads(data)


core_tempt = [] #this array will store dictionary
temp_input = [] #this array will store tempreture values

for data in data1['coretemp-isa-0000']:
    new_Data=data1['coretemp-isa-0000'][data]
    core_tempt.append(new_Data)


for i in range(1,5):
    val=core_tempt[i]['temp'+str(i)+'_input']
    temp_input.append(int(val))
    

# write tempreture to same file by overwitting json data to temp values

with open('data.txt','w') as file:  #to delete any existing value
    pass

with open('data.txt','a') as file:
    for val in temp_input:
        file.write(str(val)+'\n')




    


    


    

