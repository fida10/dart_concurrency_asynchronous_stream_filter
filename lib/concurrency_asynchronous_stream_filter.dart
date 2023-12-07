/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';

export 'src/concurrency_asynchronous_stream_filter_base.dart';

/*
Practice Question 2: Asynchronous Stream Filter

Task:

Create a function filterStreamAsync that takes a stream of integers and an 
asynchronous predicate function. The function should return a new stream 
where integers are only included if they satisfy the asynchronous predicate.
 */

Future<List<int>> filterStreamAsync(
    Stream<int> input, Function predicate) async {
  List<int> ans = [];

  await for (var indivInt in input) {
    bool match = await predicate(indivInt);
    if (match) {
      ans.add(indivInt);
    }
  }

  return ans;
}
