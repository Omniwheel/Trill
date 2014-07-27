/**
 * Created by chokkaram on 7/26/14.
 */
package com.Omniwheel.trill {
public class Trill {

  private static var sConfigured:Boolean = false;

  public function Trill() {
    throw new Error("Class Trill only has static content and is not meant to be initialized.");
  }

  public static function get configured():Boolean { return sConfigured; }

  public static function configure(suppressError:Boolean=false):void {
    if(sConfigured && !suppressError) throw new Error("Class Trill can not be configured more than one time.");
    if(sConfigured && suppressError) return;
    sConfigured = true;

    ArrayMod.configure(suppressError);
  }
}
}
