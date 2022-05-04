import 'package:flutter/cupertino.dart';

// ignore: constant_identifier_names
const Color APP_COLOR = Color.fromARGB(255, 9, 9, 9);

// ignore: constant_identifier_names
const int PAGE_LIMIT = 10;

enum SortTypes {
  // ignore: constant_identifier_names
  ASC,
  // ignore: constant_identifier_names
  DESC,

  // ignore: constant_identifier_names
  NONE,
}

enum GetTypes {
  // ignore: constant_identifier_names
  FILTER,
  // ignore: constant_identifier_names
  PAGING,
}
