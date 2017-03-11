# this is the python Washer code

import SmartFixture
import Attendant
import Room

class Washer(SmartFixture):
    def __init__(self,Name,Weight,Position,Battery_capacity):
        super(Washer,self).__init__(Name, Weight, Position, Battery_capacity)

    def Wash(self):
        print('%s finished a wash procedure.' % self._name)
