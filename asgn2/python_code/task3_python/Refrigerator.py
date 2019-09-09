# this is the python refrigerator code

import SmartFixture
import Attendant
import Room

class Refrigerator(SmartFixture):
    def __init__(self,Name,Weight,Position,Battery_capacity,Initial_temperature):
        super(Refrigerator,self).__init__(Name,Weight,Position,Battery_capacity)
        self._temperature= Initial_temperature

    def SetTemperature(self,New_temperature):
        self._temperature=New_temperature
        print ('%s was set to %.2f degrees Celsius.' % self._name, New_temperature)
