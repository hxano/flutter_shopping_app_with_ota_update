import 'dart:math' as math;

class CloudConfig {
  bool getAbTest() {
    return math.Random().nextBool();
  }
}