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

    Array.prototype["collect"] = function (block:Function):Array {
      var result:Array = [];
      for each(var element:Object in this)
        result.push(block(element));

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('collect', false);

    Array.prototype["compact"] = function ():Array {
      var result:Array = [];
      for each(var element:Object in this)
        if(element != null) result.push(element);

      return result;
    };
    Array.prototype["setPropertyIsEnumerable"]('compact', false);

    Array.prototype["first"] = function ():* {
      return this[0];
    };
    Array.prototype["setPropertyIsEnumerable"]('first', false);

    Array.prototype["last"] = function ():* {
      return this[this.length - 1];
    };
    Array.prototype["setPropertyIsEnumerable"]('last', false);

    Array.prototype["drop"] = function (quantity:uint):Array {
      return this.splice(0, quantity);
    };
    Array.prototype["setPropertyIsEnumerable"]('drop', false);
  }
}
}