'''
    /*
    * CSCI3180 Principles of Programming Languages
    *
    * --- Declaration ---
    *
    * I declare that the assignment here submitted is original except for source
    * material explicitly acknowledged. I also acknowledge that I am aware of
    * University policy and regulations on honesty in academic work, and of the
    * disciplinary guidelines and procedures applicable to breaches of such policy
    * and regulations, as contained in the website
    * http://www.cuhk.edu.hk/policy/academichonesty/
    *
    * Assignment 2
    * Name : Mao Yuxuan
    * Student ID : 1155062018
    * Email Addr : yxmao5@cse.cuhk.edu.hk
    */
'''




#this is the python code for the hotel
import abc

class Robot:
    __metaclass__=abc.ABCMeta
    def __init__(self, name, weight, position, battery_capacity):
        self._name = name
        self._weight = weight
        self._position = position
        self._battery_capacity = battery_capacity
        self._battery_remaining = battery_capacity

    def charge_battery(self, amount):
        self._battery_remaining = self._battery_remaining+amount
        if (self._battery_remaining>self._battery_capacity):
            self._battery_remaining=self._battery_capacity
        print ('%s was charged %.1f units of battery' % (self._name, amount))

    def consume_battery(self, amount):
        if(amount > self._battery_remaining):
            return -1
        else:
            self._battery_remaining=self._battery_remaining-amount
            return self._battery_remaining

    def move_to(self,destination):
        distance = abs(self._position - destination.position)
        battery_consumed = distance * self._weight
        if(self.consume_battery(battery_consumed)>0):
            self._position=destination.position
            print ('%s moved to %s.' % (self._name, destination.name))
            #print ('%s consumed %.1f battery.' % (self._name, battery_consumed))
            return battery_consumed
        else:
            print ('Not enough battery to move!')
            return -1

    def carry_to(self,obj, destination):
        battery_consumed = 0.0
        amount=0.0
        amount = self.move_to(obj)
        if(amount<0):
            print ('Not enough battery to move!')
            return
        battery_consumed += amount
        amount = self.move_to(destination)
        if(amount<0):
            print ('Not enough battery to move!')
            return
        battery_consumed += amount

        distance= abs(obj.position - destination.position)
        amount = distance * obj.weight
        if(self.consume_battery(amount)>=0):
            battery_consumed += amount
            obj.position=destination.position
            print ('%s moved to %s.' % (obj.name, destination.name))
            print ('%s consumed %.1f battery.' % (self._name, battery_consumed))
        else:
            print ('Not enough battery to move!')

    @property
    def name(self):
        return self._name
    @name.setter
    def name(self,name):
        self._name=name
    @property
    def position(self):
        return self._position
    @position.setter
    def position(self,position):
        self._position=position
    @property
    def weight(self):
        return self._weight
    @weight.setter
    def weight(self,weight):
        self._weight=weight

class Attendant:
    __metaclass__=abc.ABCMeta
    def __init__(self,name,weight,wealth,position):
        self._name=name
        self._weight=weight
        self._wealth=wealth
        self._position=position
    
    def move_to(self,destination):
        distance= abs(self._position - destination.position)
        calories_consumed = distance * self._weight
        self._position=destination.position
        print ('%s moved to %s.' % (self._name, destination.name))
        return calories_consumed
    
    def carry_to(self,obj, destination):
        calories_consumed=0.0
        calories_consumed= calories_consumed+self.move_to(obj)
        calories_consumed= calories_consumed+self.move_to(destination)
        distance= abs(obj.position - destination.position)
        obj.position=destination.position
        print ('%s moved to %s.' % (obj.name, destination.name))
        calories_consumed+= distance * obj.weight
        print ('%s consumed %0.1f calories.' % (self._name, float(calories_consumed)))
    
    def pay(self,amount):
        if (amount<=self._wealth):
            self._wealth = self._wealth - amount
            print ('%s paid %0.1f dollars.' % (self._name,float(amount)))
            return amount
        else:
            return -1

    @property
    def name(self):
        return self._name
    @name.setter
    def name(self,name):
        self._name=name
    @property
    def position(self):
        return self._position
    @position.setter
    def position(self,position):
        self._position=position
    @property
    def weight(self):
        return self._weight
    @weight.setter
    def weight(self,weight):
        self._weight=weight


class Room:
    __metaclass__=abc.ABCMeta
    def __init__(self,name,position):
        self._name=name
        self._position=position
    
    @property
    def name(self):
        return self._name
    @name.setter
    def name(self,name):
        self._name=name
    @property
    def position(self):
        return self._position
    @position.setter
    def position(self,position):
        self._position=position



class DiningHall(Room):
    def __init__(self,name,position,dinner_price):
        super(DiningHall,self).__init__(name,position)
        self._dinner_price=dinner_price
    
    def server_dinner_to(self,obj):
        if(obj.position==self._position):
            if(obj.pay(self._dinner_price)>=0):
                print ('%s finished the dinner.' % (obj.name))
            else:
                print ("%s didn't have enough money." % (obj.name))
        else:
            print ('%s was too far away to be served.' % (obj.name))


class Fixture:
    __metaclass__=abc.ABCMeta
    def __init__(self, name, weight, position):
        self._name = name
        self._weight = weight
        self.position = position
    
    @property
    def name(self):
        return self._name
    @name.setter
    def name(self,name):
        self._name=name
    @property
    def position(self):
        return self._position
    @position.setter
    def position(self,position):
        self._position=position
    @property
    def weight(self):
        return self._weight
    @weight.setter
    def weight(self,weight):
        self._weight=weight
    
    @abc.abstractmethod
    def move_to(self, destination):
        pass


class SmartFixture(Fixture):
    def __init__(self, name, weight, position, battery_capacity):
        super(SmartFixture,self).__init__(name, weight, position)
        self._battery_capacity = battery_capacity
        self._battery_remaining = battery_capacity
    
    def charge_battery(self, amount):
        self._battery_remaining = self._battery_remaining+amount
        if (self._battery_remaining>self._battery_capacity):
            self._battery_remaining=self._battery_capacity
        print ('%s was charged %0.1f units of battery' % (self._name, float(amount)))
    
    def consume_battery(self, amount):
        if(amount > self._battery_remaining):
            return -1
        else:
            self._battery_remaining=self._battery_remaining-amount
            return self._battery_remaining

    def move_to(self,destination):
        distance = abs(self.position - destination.position)
        battery_consumed = distance * self._weight
        if(self.consume_battery(battery_consumed)>0):
            self.position=destination.position
            print ('%s moved to %s.' % (self._name, destination.name))
            print ('%s consumed %0.1f battery.' % (self._name, float(battery_consumed)))
        else:
            print ('Not enough battery to move!')


class Refrigerator(SmartFixture):
    def __init__(self,name,weight,position,battery_capacity,initial_temperature):
        super(Refrigerator,self).__init__(name,weight,position,battery_capacity)
        self._temperature= initial_temperature
    
    def set_temperature(self,New_temperature):
        self._temperature=New_temperature
        print ('%s was set to %0.1f degrees Celsius.' % (self._name, float(New_temperature)))


class Washer(SmartFixture):
    def __init__(self,name,weight,position,battery_capacity):
        super(Washer,self).__init__(name, weight, position, battery_capacity)
    
    def wash(self):
        print('%s finished a wash procedure.' % (self._name))


class DumbFixture(Fixture):
    def __init__(self, name, weight, position, person_in_charge):
        super(DumbFixture,self).__init__(name, weight, position)
        self._person_in_charge = person_in_charge
    
    def move_to(self, destination):
        self._person_in_charge.carry_to(self, destination)
    
    def assign_to(self,person_in_charge):
        self._person_in_charge=person_in_charge


class Chair(DumbFixture):
    def __init__(self,name,weight,position,person_in_charge,seat_back):
        super(Chair,self).__init__(name,weight,position,person_in_charge)
        self._seat_back=seat_back


class Table(DumbFixture):
    def __init__(self,name,weight,position,person_in_charge,extendable):
        super(Table,self).__init__(name, weight, position, person_in_charge)
        self._extendable = extendable

class Hotel:
    @classmethod
    def move_room(cls,obj_list,destination):
        for obj in obj_list:
            obj.move_to(destination)



jarvis =Robot("Jarvis", 30, 3, 5000)
# stuff in room 2046
mary = Attendant("Mary", 45, 90000, 1)
tony = Attendant("Tony", 60, 1000000, 1)
washer1 = Washer("Washer 1", 55, 1, 5000)
refrigerator1 =Refrigerator("Refrigerator 1", 50, 1, 5000, 3)
table1 =Table("Table 1", 20, 1, jarvis, True)
chair1 = Chair("Chair 1", 8, 1, jarvis, False)
old_room_stuff = [mary, tony, washer1, refrigerator1, table1, chair1]
# rooms
old_room =Room("Room 2046", 1)
new_room = Room("Room 2047", 5)
dining_hall_1 =DiningHall("Dinning hall 1", 12, 80)
# move all the stuff to the new room
Hotel.move_room(old_room_stuff, new_room);
# Jarvis charge
jarvis.charge_battery(500);
