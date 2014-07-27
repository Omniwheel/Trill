Trill
=====

Trill is a utility library that patches AS3 core data types like Array, String, Date, etc. to have ruby/rails like features.


Usage
=====
Add the following at the earliest possible to configure all library functionality:
Trill.configure();

or selectively configure library functionality:
ArrayMod.configure();

Once configured you can use the new features using the syntax in the following examples:
[1,2,3]["first"](); \\ Returns 1

[1,2,3]["last"](); \\ Returns 3

var collection:Array = [{ entry:1 }, { entry:2 }, { entry:3 }];
collection["collect"](function(element:Object):Number { return element.entry }); \\ Returns [1,2,3] 

[1,2,3,null,4,null,5]["compact"](); \\ Returns [1,2,3,4,5]


How it works
============

Trill uses AS3's class prototype to patch additional functionality to existing AS3 classes.
See the following for more information on AS3 prototype:
http://help.adobe.com/en_US/ActionScript/3.0_ProgrammingAS3/WS5b3ccc516d4fbf351e63e3d118a9b90204-7f3f.html


Caution
=======

Using prototype is slower than extending a class.


Why all the goofy syntax
========================
Event though these classes are marked dynamic, many IDE's will mark [1,2,3].first() as invalid. In some cases like [1,2,3].first() the code will still run without error even if the IDE complains. In other cases compilation will fail. Alternatively you can type cast to an Object and call functions like normal ([1,2,3] as Object).first().


Whats a Trill
=============
A Trill is a fictional symbiotic organism from Star Trek. Trill need humanoid hosts to survive, in return they provide some enhancements (mostly experience) to their host. 
See the following for more information:
http://en.memory-alpha.org/wiki/Trill
