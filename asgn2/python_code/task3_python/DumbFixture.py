#this is the python dump Fixture


import Fixture
import Attendant
import Room

class DumbFixture(Fixture):
    def __init__(self, Name, Weight, Position, Person_in_charge):
        Fixture.__init__(self, Name, Weight, Position)
        self._person_in_charge = Person_in_charge

    def MoveTo(self, Destination):
        self._person_in_charge.CarryTo(self, Destination)

    def AssignTo(self,Person_in_charge):
        self._person_in_charge=Person_in_charge
