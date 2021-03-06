{
w (inp ["move" "north"])
s (inp ["move" "south"])
d (inp ["move" "east"])
a (inp ["move" "west"])
KEY_UP (inp ["move" "north"])
KEY_DOWN (inp ["move" "south"])
KEY_RIGHT (inp ["move" "east"])
KEY_LEFT (inp ["move" "west"])
k (inp ["move" "north"])
j (inp ["move" "south"])
l (inp ["move" "east"])
h (inp ["move" "west"])
e (inp ["take" (selectorvalue "ground")])
q (inp ["drop" (selectorvalue "inventory")])
E (inp ["use" (selectorvalue "inventory")])
R (inp ["interact"])
r (do [
    (inp ["interact"])
    (inp ["interact" "north"])
    (inp ["interact" "south"])
    (inp ["interact" "east"])
    (inp ["interact" "west"])])
c (.select (selector "inventory") 1 True True)
x (.select (selector "ground") 1 True True)
v (.select (selector "equipment") 1 True True)
z (inp ["unequip" (selectorvalue "equipment")])
f (do [
    (inp ["attack"])
    (inp ["attack" "north"])
    (inp ["attack" "south"])
    (inp ["attack" "east"])
    (inp ["attack" "west"])])
F (inp ["attack"])
W (inp ["attack" "north"])
S (inp ["attack" "south"])
D (inp ["attack" "east"])
A (inp ["attack" "west"])
t (self.parseMessage (self.display.getString))
NEWLINE (self.parseMessage (self.display.getString))
KEY_PPAGE (self.display.scrollBack 1)
KEY_NPAGE (self.display.scrollBack -1)
help "\
Controls:
 wasd or arrows:
    Move around
 e: Grab
 q: Drop
 E: Use/Equip
 r: Interact
 f: Attack
 t: Chat
 z: Unequip
 xcv: scroll
 ctrl-c: close client"
;;  init ((. (self.display.getWidget "inventory") setTitle) "Inventory (c)")
}
