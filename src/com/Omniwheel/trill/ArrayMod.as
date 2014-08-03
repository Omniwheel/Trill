package com.Omniwheel.trill {
public class ArrayMod {

  private static var sConfigured:Boolean = false;

  public function ArrayMod() {
    throw new Error("Class ArrayMod only has static content and is not meant to be initialized.");
  }

  public static function get configured():Boolean { return sConfigured; }

  public static function configure(suppressError:Boolean=false):void {
    if(sConfigured && !suppressError) throw new Error("Class ArrayMod can not be configured more than one time.");
    if(sConfigured && suppressError) return;
    sConfigured = true;

    // Dependencies
    modCopy();

    modAll();
    modAny();
    modCollect();
    modCompact();
    modConcatArray();
    modCount();
    modDrop();
    modEach();
    modEachIndex();
    modFind();
    modFirst();
    modFlatten();
    modInclude();
    modIsEmpty();
    modLast();
    modReject();
    modSample();
    modSelect();
  }

  private static function modAll():void {
    Array.prototype["all"] = function (block:Function):Boolean {
      for each(var element:Object in this) {
        if(!block(element)) return false;
      }

      return true;
    };
    Array.prototype["setPropertyIsEnumerable"]('all', false);
  }

  private static function modAny():void {
    Array.prototype["any"] = function (block:Function):Boolean {
      for each(var element:Object in this) {
        if(block(element)) return true;
      }

      return false;
    };
    Array.prototype["setPropertyIsEnumerable"]('any', false);
  }

  private static function modCollect():void {
    Array.prototype["collect"] = function (block:Function):Array {
      var result:Array = [];
      for each(var element:Object in this)
        result.push(block(element));

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('collect', false);
  }

  private static function modCompact():void {
    Array.prototype["compact"] = function ():Array {
      var result:Array = [];
      for each(var element:Object in this)
        if(element != null) result.push(element);

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('compact', false);
  }

  private static function modConcatArray():void {
    Array.prototype["concatArray"] = function (left:Array):Array {
      var right:Array = this["copy"]();
      for each(var element:Object in left)
        if(element != null) right.push(element);

      return right;
    };
    Array.prototype["setPropertyIsEnumerable"]('concatArray', false);
  }

  private static function modCopy():void {
    Array.prototype["copy"] = function ():Array {
      var result:Array = this.concat(); // Copies Array

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('copy', false);
  }

  private static function modCount():void {
    Array.prototype["count"] = function (block:Function):Number {
      var result:Number = 0;
      for each(var element:Object in this)
        result += block(element);

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('count', false);
  }

  private static function modDrop():void {
    Array.prototype["drop"] = function (quantity:uint):Array {
      return this.splice(0, quantity);
    };
    Array.prototype["setPropertyIsEnumerable"]('drop', false);
  }

  private static function modEach():void {
    Array.prototype["each"] = function (block:Function):void {
      for each(var element:Object in this)
        block(element);
    };
    Array.prototype["setPropertyIsEnumerable"]('each', false);
  }

  private static function modEachIndex():void {
    Array.prototype["eachIndex"] = function (block:Function):void {
      for(var i:int = 0; i < this.length; i++ )
        block(this[i]);
    };
    Array.prototype["setPropertyIsEnumerable"]('eachIndex', false);
  }

  private static function modFind():void {
    Array.prototype["find"] = function (block:Function):* {
      for(var i:int = 0; i < this.length; i++ )
        if(block(this[i])) return this[i];

      return null;
    };
    Array.prototype["setPropertyIsEnumerable"]('find', false);
  }

  private static function modFirst():void {
    Array.prototype["first"] = function ():* {
      return this[0];
    };
    Array.prototype["setPropertyIsEnumerable"]('first', false);
  }

  private static function modFlatten():void {
    Array.prototype["flatten"] = function (level:int = -1):Array {
      if (level == 0)
        return (this as Array);

      var flattened:Array = [];

      for each(var element:Object in this) {
        if (element is Array) {
          flattened = flattened.concat(element["flatten"](level - 1));
        } else {
          flattened.push(element);
        }
      }

      return flattened;
    };
    Array.prototype["setPropertyIsEnumerable"]('flatten', false);
  }

  private static function modInclude():void {
    Array.prototype["include"] = function (object:*):Boolean {
      for each(var element:Object in this)
        if(element == object) return true;

      return false;
    };
    Array.prototype["setPropertyIsEnumerable"]('include', false);
  }

  private static function modIsEmpty():void {
    Array.prototype["isEmpty"] = function ():Boolean {
      return this.length == 0;
    };
    Array.prototype["setPropertyIsEnumerable"]('isEmpty', false);
  }

  private static function modLast():void {
    Array.prototype["last"] = function ():* {
      return this[this.length - 1];
    };
    Array.prototype["setPropertyIsEnumerable"]('last', false);
  }

  private static function modReject():void {
    Array.prototype["reject"] = function (block:Function):Array {
      var result:Array = [];
      for each(var element:Object in this)
        if(!block(element)) result.push(block(element));

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('reject', false);
  }

  private static function modSample():void {
    Array.prototype["sample"] = function (quantity:int=1):Array {
      var result:Array = [];
      if(quantity < 1) throw new Error("Sample quantity must be greater than 0.");
      for(var i:int = 0; i < quantity; i++)
        result.push(this[Math.round(Math.random() * quantity)]);

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('sample', false);
  }

  private static function modSelect():void {
    Array.prototype["select"] = function (block:Function):Array {
      var result:Array = [];
      for each(var element:Object in this)
        if(block(element)) result.push(block(element));

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('select', false);
  }
}
}