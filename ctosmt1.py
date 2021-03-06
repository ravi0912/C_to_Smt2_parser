#
#	Created by Ravi Kumar
#
#	Date Oct 7,2016
#


#!/usr/bin/python
import sys
import os
import re
import string
from sets import Set
from pythonds.basic.stack import Stack

#---------------------------------------Infix to PostFix---------------------------------------#
def infixToPostfix(infixexpr):
	prec = {}
	prec["*"] = 4
	prec["/"] = 4
	prec["+"] = 3
	prec["-"] = 3
	prec["("] = 2
	prec[">="] = 1
	prec["=="] = 1
	prec["<="] = 1
	prec["="] = 0
	opStack = Stack()
	postfixList = []
	tokenList = infixexpr.split()

	for token in tokenList:
		if token in "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" or token in '0123456789':
			postfixList.append(token)
		elif token == '(':
			opStack.push(token)
		elif token == ')':
			topToken = opStack.pop()
			while topToken != '(':
				postfixList.append(topToken)
				topToken = opStack.pop()
		else:
			while (not opStack.isEmpty()) and \
				(prec[opStack.peek()] >= prec[token]):
					postfixList.append(opStack.pop())
			opStack.push(token)

	while not opStack.isEmpty():
		postfixList.append(opStack.pop())
	return " ".join(postfixList)

#---------------------------------------PostFix to Smt2---------------------------------------#
def postfixToSmt2(s):
	st = Stack()
	s = s.split()
	l_s = len(s)-1
	sol = ''
	for i in range(0,l_s+1):
		if s[i] in "+-*/=" or s[i] in "<=>==":
			Y = st.pop()
			if st.isEmpty():
				X=''
			else :
				X = st.pop()
			z='( '+s[i]+' '+X+' '+Y+' )'
			st.push(z)
		else:
			st.push(s[i])
	return st.pop()
	



#---------------------------------------support function---------------------------------------#

def dataType(x):
	return {
		'int': 'int',
		'char': 'char',
		'bool': 'bool',
	}[x]

def defDataType( string ,file):
	string = string[:-1]
	sp = re.split(r'[=,\s]\s*', string)
	dp = dataType(sp[0])
	for i in range(1,len(sp)):
		if not sp[i].isdigit() and sp[i]:
			file.write("(declare-const "+sp[i]+" "+dp+")\n\n")

	return;

def operationPrint(string,file):
	op_st = string[:-1]
	op_st = " ".join(op_st)
	op_st = ' '.join(op_st.split())
	op_st = op_st.replace("< =","<=")
	op_st = op_st.replace("= =","==")
	op_st = op_st.replace("> =",">=")
	print op_st
	op_st = infixToPostfix(op_st)
	op_st = " ".join(op_st)
	op_st = ' '.join(op_st.split())
	op_st = op_st.replace("< =","<=")
	op_st = op_st.replace("= =","==")
	op_st = op_st.replace("> =",">=")
	op_st = postfixToSmt2(op_st)
	file.write("(assert "+op_st+")\n\n")




#---------------------------------------main function---------------------------------------#

# Open a file

p = sys.argv
fo = open(p[-1], "r")

#search for main function
lookup = 'main'
start=-1;

for num, line in enumerate(fo, 1):
	if lookup in line:
		start = num
		break

#abort if main function not found
if start == -1 :
	sys.exit("Aborting!!!\nError : main() function is missing")

#naming file name
name=fo.name
name = name[:-1]
extension="smt2"
name=name+extension

#creating file for smt2
try:
	os.remove(name)
except OSError:
	pass

file=open(name,'a')

file.write("(set-option :produce-models true)\n\n")

fo.seek(0)

l = fo.readlines()

notToRead = Set();

for i in range(start,len(l)):
	l[i] = l[i].lstrip()
	l[i] = l[i].rstrip()
	if l[i].startswith('int') or l[i].startswith('char') or l[i].startswith('bool'):
		notToRead.add(i);
		defDataType(l[i],file)

for i in range(start,len(l)):
	if i not in notToRead :
		if not l[i].startswith('if') and "=" in l[i]:
			operationPrint(l[i],file)


file.write("(check-sat)\n\n")
file.write("(exit)\n\n")

file.close()

fo.close()