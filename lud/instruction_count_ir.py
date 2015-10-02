#! /usr/bin/python


####################################################

####################################################
lineCount = 0
totalInstCount = 0
instList = []
instructionSetList = []
functionFlag = False
candidateDic = {}
count=0

with open("inst_select_ir.txt") as file:
	for line in file:
		line = line.replace('\n','')
		instructionSetList.append(line)

with open("lud_kernels.ll") as f:
	for line in f:
		instList.append(line)


for line in instList:
	# Entering function
	if functionFlag == True:
		if "=" in line and "phi" not in line and "; <label>" not in line and "; preds = " not in line:
			for instruction in instructionSetList:
				instruction = " "+instruction+" "
				if "call" in line:
					if "@llvm" in line:
						if instruction in line:
							if instruction in candidateDic:
								candidateDic[instruction] = candidateDic[instruction] + 1
							else:
								candidateDic[instruction] = 1
							print line
					#	print line
						totalInstCount += 1
				else:
					if instruction in line:
						if instruction in candidateDic:
							candidateDic[instruction] = candidateDic[instruction] + 1
						else:
							candidateDic[instruction] = 1
						print line
				#	print line
					totalInstCount += 1
				count=count+1
	# Check if exit a function
	if "ret" in line:
		functionFlag = False
	
	# Check if entering a function
	if "define" in line and "@" in line and "{" in line:
		functionFlag = True

	
print "Total Injectable Instruction #: " + `totalInstCount`

for candidate in candidateDic:
	print "Total Instructions of " + candidate + " found matched #: " + `candidateDic[candidate]`


