from math import exp
from random import randint

def neuron(sygnalsWithWages):
    funcCoef=1/800
    return decision(activation(sum(sygnalsWithWages),funcCoef))

def decision(out):
    out*=100
    randomNumber=randint(1, 100)
    if(randomNumber>out):
        return 0
    else:
        return 1

def activation(net, a):
    return 1/(1+exp(-a*net))

def sum(inputList):
    element=""
    weightedSum=0
    for element in inputList:
        weightedSum+=element[0]*element[1]
    return weightedSum
