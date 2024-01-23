import 'package:flutter_test/flutter_test.dart';
import 'package:pinger/extensions.dart';

void main() {
  group("IterableExtensions", () {
    test("mapIndexed iterates over list with current index", () {
      final list = [8, 2, 9, 5, 1, 7, 0];

      final matchesInput = list.mapIndexed((i, e) => list[i] == e).every((it) => it);

      expect(matchesInput, true);

      int? lastIndex;
      final iteratesInOrder = list.mapIndexed((i, _) {
        final delta = i - (lastIndex ?? -1);
        lastIndex = i;
        return delta;
      }).every((it) => it == 1);

      expect(iteratesInOrder, true);
    });
  });

  group('NullableIterableExtensions', () {
    test("isNullOrEmpty returns true only if list exists and has element", () {
      List? list = [true, 2, "item"];

      expect(list.isNullOrEmpty, false);

      list.clear();

      expect(list.isNullOrEmpty, true);

      list = null;

      expect(list.isNullOrEmpty, true);
    });

    test("lastOrNull returns null if list is empty", () {
      final list = [];

      expect(list.lastOrNull, null);
    });

    test("lastOrNull returns last element if list is not empty", () {
      final List list = [4];

      expect(list.lastOrNull, 4);

      list.add(null);

      expect(list.lastOrNull, null);
    });
  });
}
