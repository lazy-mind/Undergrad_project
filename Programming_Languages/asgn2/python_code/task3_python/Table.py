# this is the python table code

import DumbFixture
import Attendant
import Room

class Table(DumbFixture):
    def __init__(self,Name,Weight,Position,Person_in_charge,Extendable):
        super(Table,self).__init__(Name, Weight, Position, Person_in_charge)
        self._extendable = Extendable

