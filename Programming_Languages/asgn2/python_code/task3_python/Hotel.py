#this is the python code for the hotel
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
        print ('%s moved to %s.' % (self._name, Destination.GetName()))
        return calories_consumed
    
    def CarryTo(self,Obj, Destination):
        calories_consumed=0.0
        calories_consumed= calories_consumed+self.MoveTo(Obj)
        calories_consumed= calories_consumed+self.MoveTo(Destination)
        distance= abs(Obj.GetPosition() - Destination.GetPosition())
        Obj.position=Destination.GetPosition()
        print ('%s moved to %s.' % (Obj.GetName(), Destination.GetName()))
        calories_consumed+= distance * Obj.GetWeight()
        print ('%s consumed %.1f calories.' % (self._name, calories_consumed))
    
    def GetName(self):
        return self._name
    
    def GetPosition(self):
        return self._position
    
    def GetWeight(self):
        return self._weight
    
    def Pay(self,Amount):
        if (Amount<=self._wealth):
            self._wealth = self._wealth - Amount
            print ('%s paid %.1f dollars.' % (self._name,Amount))
            return Amount
        else:
            return -1


class Room:
    __metaclass__=abc.ABCMeta
    def __init__(self,Name,Position):
        self._name=Name
        self._position=Position
    
    def GetName(self):
        return self._name
    
    def GetPosition(self):
        return self._position


class DiningHall(Room):
    def __init__(self,Name,Position,Dinner_price):
        super(DiningHall,self).__init__(Name,Position)
        self._dinner_price=Dinner_price
    
    def ServerDinnerTo(self,Obj):
        if(Obj.GetPosition()==self._position):
            if(Obj.Pay(self._dinner_price)>=0):
                print ('%s finished the dinner.' % (Obj.GetName()))
            else:
                print ("%s didn't have enough money." % (Obj.GetName()))
        else:
            print ('%s was too far away to be served.' % (Obj.GetName()))


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


class SmartFixture(Fixture):
    def __init__(self, Name, Weight, Position, Battery_capacity):
        super(SmartFixture,self).__init__(Name, Weight, Position)
        self._battery_capacity = Battery_capacity
        self._battery_remaining = Battery_capacity
    
    def ChargeBattery(self, Amount):
        self._battery_remaining = self._battery_remaining+Amount
        if (self._battery_remaining>self._battery_capacity):
            self._battery_remaining=self._battery_capacity
        print ('%s was charged %.1f units of battery' % (self._name, Amount))
    
    def ConsumeBattery(self, Amount):
        if(Amount > self._battery_remaining):
            return -1
        else:
            self._battery_remaining=self._battery_remaining-Amount
            return self._battery_remaining

    def MoveTo(self,Destination):
        distance = abs(self.position - Destination.GetPosition())
        battery_consumed = distance * self._weight
        if(self.ConsumeBattery(battery_consumed)>0):
            self.position=Destination.GetPosition()
            print ('%s moved to %s.' % (self._name, Destination.GetName()))
            print ('%s consumed %.1f battery.' % (self._name, battery_consumed))
        else:
            print ('Not enough battery to move!')


class Refrigerator(SmartFixture):
    def __init__(self,Name,Weight,Position,Battery_capacity,Initial_temperature):
        super(Refrigerator,self).__init__(Name,Weight,Position,Battery_capacity)
        self._temperature= Initial_temperature
    
    def SetTemperature(self,New_temperature):
        self._temperature=New_temperature
        print ('%s was set to %.1f degrees Celsius.' % (self._name, New_temperature))


class Washer(SmartFixture):
    def __init__(self,Name,Weight,Position,Battery_capacity):
        super(Washer,self).__init__(Name, Weight, Position, Battery_capacity)
    
    def Wash(self):
        print('%s finished a wash procedure.' % (self._name))


class DumbFixture(Fixture):
    def __init__(self, Name, Weight, Position, Person_in_charge):
        super(DumbFixture,self).__init__(Name, Weight, Position)
        self._person_in_charge = Person_in_charge
    
    def MoveTo(self, Destination):
        self._person_in_charge.CarryTo(self, Destination)
    
    def AssignTo(self,Person_in_charge):
        self._person_in_charge=Person_in_charge


class Chair(DumbFixture):
    def __init__(self,Name,Weight,Position,Person_in_charge,Seat_back):
        super(Chair,self).__init__(Name,Weight,Position,Person_in_charge)
        self._seat_back=Seat_back


class Table(DumbFixture):
    def __init__(self,Name,Weight,Position,Person_in_charge,Extendable):
        super(Table,self).__init__(Name, Weight, Position, Person_in_charge)
        self._extendable = Extendable

class Hotel:
    @classmethod
    def MoveRoom(cls,Obj_list,Destination):
        for obj in Obj_list:
            obj.MoveTo(Destination)


# stuff in room 2046
peter = Attendant('Peter',58,10000,7)
mary = Attendant('Mary',45,90000,1)
tony = Attendant('Tony',60,1000000,1)
washer1 = Washer('Washer 1',55,1,5000)
refrigerator1 =Refrigerator('Refrigerator 1', 50, 1, 5000, 3)
table1 = Table('Table 1', 20, 1, peter, bool(1));
chair1 = Chair("Chair 1", 8, 1, peter, bool(0));
# stuff list
list = [mary,tony,washer1, refrigerator1,table1,chair1]
# there are 3 rooms
old_room = Room("Room 2046", 1);
new_room = Room("Room 2047", 5);
dining_hall_1 = DiningHall('Dinning hall 1', 12, 80);

#move all the stuff to room
Hotel.MoveRoom(list,new_room)
peter.MoveTo(dining_hall_1)
dining_hall_1.ServerDinnerTo(peter)
