#! /usr/bin/python


####################################################

####################################################
lineCount = 0
totalInstCount = 0
instList = []
instructionSetList = []
functionFlag = False
candidateDic = {}


with open("inst_select_sass.txt") as file:
	for line in file:
		line = line.replace('\n','')
		instructionSetList.append(line)

with open("lud_sass.txt") as f:
	for line in f:
		instList.append(line)


for line in instList:
	# Entering function
	if functionFlag == True:
		if ", " in line:
			for instruction in instructionSetList:
				instruction = " " + instruction + " "
				if instruction in line:
					if instruction in candidateDic:
						candidateDic[instruction] = candidateDic[instruction] + 1
					else:
						candidateDic[instruction] = 1
					print line
				totalInstCount += 1
	
	if ".................." in line:
		functionFlag = False

	# Check if entering a function
	if "Function : " in line:
		functionFlag = True

	
print "Total Injectable Instruction #: " + `totalInstCount`

for candidate in candidateDic:
	print "Total Instructions of " + candidate + " found matched #: " + `candidateDic[candidate]`


