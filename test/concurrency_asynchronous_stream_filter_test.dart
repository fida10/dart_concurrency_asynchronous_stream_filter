import 'package:concurrency_asynchronous_stream_filter/concurrency_asynchronous_stream_filter.dart';
import 'package:test/test.dart';

Future<bool> isEvenNumberAsync(int number) async {
  // Simulate asynchronous operation
  await Future.delayed(Duration(milliseconds: 10));
  return number % 2 == 0;
}

void main() {
  test('filterStreamAsync filters stream based on an asynchronous predicate',
      () async {
    var input = Stream.fromIterable([1, 2, 3, 4, 5]);
    var filtered = filterStreamAsync(input, isEvenNumberAsync);
    // Expecting the filtered list to contain only even numbers
    expect(await filtered, equals([2, 4]));
  });
}
