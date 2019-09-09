#this is the python smart Fixture

import abc
import Fixture
#import Attendant
#import Room

class SmartFixture(Fixture):

    def __init__(self, Name, Weight, Position, Battery_capacity):
        Fixture.__init__(self,Name, Weight, Position)
        self._battery_capacity = Battery_capacity
        self._battery_remaining = Battery_capacity

    def ChargeBattery(self, Amount):
        self._battery_remaining = self._battery_remaining+Amount
        if (self._battery_remaining>self._battery_capacity):
            self._battery_remaining=self._battery_capacity
        print ('%s was charged %.2f units of battery' % self._name, Amount)

    def ConsumeBattery(self, Amount):
        if(Amount > _battery_remaining):
            return -1
        else:
            self._battery_remaining=self._battery_remaining-Amount
            return sefl._battery_remaining

    def MoveTo(self,Destination):
        distance = abs(self.position - Destination.GetPosition())
        battery_consumed = distance * self._weight
        if(self.ConsumeBattery(battery_consumed)>0):
            self.position=Destination.GetPosition()
            print ('%s moved to %s.' % self._name, Destination.GetName())
            print ('%s consumed %.2f battery.' % self._name, battery_consumed)
        else:
            print ('Not enough battery to move!')
