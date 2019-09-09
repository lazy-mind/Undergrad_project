# this is the python Dinning hall code
import Attendant
import DumbFixture
import Room
import SmartFixture

class DiningHall(Room):
    def __init__(self,Name,Position,Dinner_price):
        super(DiningHall,self).__init__(Name,Position)
        self._dinner_price=Dinner_price

    def ServerDinnerTo(self,Obj):
        if(Obj.GetPosition()==self._position):
            if(Obj.Pay(self._dinner_price)>=0):
                print ('%s finished the dinner.' % Obj.GetName())
            else:
                print ("%s didn't have enough money." % Obj.GetName())
        else:
            print ('%s was too far away to be served.' % Obj.GetName())

