# this is the python chair code
import Attendant
import DumbFixture
import Room
import SmartFixture

class Chair(DumbFixture):
    def __init__(self,Name,Weight,Position,Person_in_charge,Seat_back):
        super(Chair,self).__init__(Name,Weight,Position,Person_in_charge)
        self._seat_back=Seat_back
