void invariant(dynamic test, String message) {
  if (test == null || !(test?.isNotEmpty ?? false)) {
    throw new AssertionError(message);
  }
}
