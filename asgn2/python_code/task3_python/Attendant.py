#this is the python Attendent!

import Attendant
import DumbFixture
import Room
import SmartFixture
import abc

class Attendant:
    __metaclass__=abc.ABCMeta
    def __init__(self,Name,Weight,Wealth,Position):
        self._name=Name
        self._weight=Weight
        self._wealth=Wealth
        self._position=Position

    def MoveTo(self,Destination):
        distance= abs(self._position - Destination.GetPosition())
        calories_consumed = distance * self._weight
        self._position=Destination.GetPosition()
        print ('%s moved to %s.' % self._name, Destination.GetName())
        return calories_consumed

    def MoveTo(self,Destination, Obj):
        distance= abs(Obj.GetPosition() - Destination.GetPosition())
        calories_consumed = distance * Obj.GetWeight()
        Obj.position=Destination.GetPosition()
        print ('%s moved to %s.' % Obj.GetName, Destination.GetName())
        return calories_consumed

    def CarryTo(self,Obj, Destination):
        calories_consumed=0.0
        calories_consumed= calories_consumed+self.MoveTo(Obj)
        calories_consumed= calories_consumed+self.MoveTo(Destination)
        calories_consumed= calories_consumed+self.MoveTo(Destination, Obj)
        print ('%s consumed %.2f calories.' % self._name, calories_consumed)

    def GetName(self):
        return self._name

    def GetPosition(self):
        return self._position

    def GetWeight(self):
        return self._weight

    def Pay(self,Amount):
        if (Amount<=self._wealth):
            self._wealth = self._wealth - Amount
            print ('%s paid %.2f dollars.' % self._name,Amount)
            return Amount
        else:
            return -1
