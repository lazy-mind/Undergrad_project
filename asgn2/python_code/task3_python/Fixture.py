# this is the python version of the Fixture

#import Attendant
#import Room

import abc

class Fixture:
    __metaclass__=abc.ABCMeta

    def __init__(self, Name, Weight, Position):
        self._name = Name
        self._weight = Weight
        self.position = Position
    
    def GetName(self):
        return self._name

    def GetPosition(self):
        return self.position
    
    def GetWeight(self):
        return self._weight

    @abc.abstractmethod
    def MoveTo(self, Destination):
        pass
    
    #public abstract void MoveTo(Room Destination);




class SmartFixture(Fixture):
    
    def __init__(self, Name, Weight, Position, Battery_capacity):
        Fixture.__init__(self,Name, Weight, Position)
        self.__battery_capacity = Battery_capacity
        self.__battery_remaining = Battery_capacity
    
    def ChargeBattery(self, Amount):
        self.__battery_remaining = self.__battery_remaining+Amount
        if (self.__battery_remaining>self.__battery_capacity):
            self.__battery_remaining=self.__battery_capacity
        print ('%s was charged %.2f units of battery' % self.__name, Amount)
    
    def ConsumeBattery(self, Amount):
        if(Amount > __battery_remaining):
            return -1
        else:
            self.__battery_remaining=self.__battery_remaining-Amount
            return sefl.__battery_remaining

    def MoveTo(self,Destination):
        distance = abs(self.__position - Destination.GetPosition())
        battery_consumed = distance * self.__weight
        if(self.ConsumeBattery(battery_consumed)>0):
            self.__position=Destination.GetPosition()
            print ('%s moved to %s.' % self.__name, Destination.GetName())
            print ('%s consumed %.2f battery.' % self.__name, battery_consumed)
        else:
            print ('Not enough battery to move!')
