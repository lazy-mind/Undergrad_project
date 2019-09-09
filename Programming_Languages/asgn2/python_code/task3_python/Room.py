# this is the python room code

import Attendant
import DumbFixture
import SmartFixture
import abc

class Room:
    __metaclass__=abc.ABCMeta
    def __init__(self,Name,Position):
        self._name=Name
        self._position=Position

    def GetName(self):
        return self._name

    def GetPosition(self):
        return self._position
