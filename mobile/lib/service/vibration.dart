import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:injectable/injectable.dart';

@injectable
class Vibration {
  void feedback() {
    Vibrate.feedback(FeedbackType.medium);
  }
}
