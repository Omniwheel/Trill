package {
import com.Omniwheel.trill.ArrayMod;

import org.flexunit.Assert;

public class ArrayModTest {
  public function ArrayModTest() {
  }

  [Before]
  public function setUp():void {
    ArrayMod.configure();
  }

  [Test]
  public function testName():void {
    Assert.assertEquals(true, [true]["all"](function(element:Boolean):Boolean { return element; }));
  }
}
}
