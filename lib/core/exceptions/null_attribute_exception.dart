/// This exception should be thrown when there's a missing required attribute in
/// the class constructor.
class NullAttributeException implements Exception {
  String _exceptionMessage;

  /// Usage:
  ///
  /// ```dart
  /// assert(someAttribute != null, throw NullAttributeException('someAttribute'))
  /// ```
  NullAttributeException(String attribute)
      : assert(attribute != null, throw NullAttributeException('attribute')) {
    _exceptionMessage = '$attribute attribute cannot be null';
  }

  @override
  String toString() {
    return _exceptionMessage;
  }
}
