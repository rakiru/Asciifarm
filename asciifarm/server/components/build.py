
from .. import gameobjects
from .component import Component

class Build(Component):
    """ item type for item that can be placed on the map to become something more static (like buildable walls or crops)"""
    
    def __init__(self, objType, objArgs=(), objKwargs=None, flagsNeeded=frozenset(), blockingFlags=frozenset()):
        if objKwargs is None:
            objKwargs = {}
        self.buildType = objType
        self.buildArgs = objArgs
        self.buildKwargs = objKwargs
        self.flagsNeeded = set(flagsNeeded)
        self.blockingFlags = set(blockingFlags)
    
    def attach(self, obj):
        self.owner = obj
        obj.addListener("roomjoin", self.roomJoin)
    
    def roomJoin(self, obj, roomData):
        self.roomData = roomData
    
    
    def use(self, user):
        groundFlags = user.getGround().getFlags()
        if not self.flagsNeeded <= groundFlags or groundFlags & self.blockingFlags: # <= means subset when applied on sets
            # groundFlags must contain all of self.flagsNeeded, and none of self.blockingFlags
            return
        roomData = user.getRoomData()
        obj = gameobjects.makeEntity(self.buildType, roomData, *self.buildArgs, preserve=True, **self.buildKwargs)
        obj.place(user.getGround())
        self.owner.trigger("drop")
        
    def toJSON(self):
        return {
            "objType": self.buildType,
            "objArgs": self.buildArgs,
            "objKwargs": self.buildKwargs,
            "flagsNeeded": list(self.flagsNeeded),
            "blockingFlags": list(self.blockingFlags)
        }
    
