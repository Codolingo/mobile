abstract class CodolingoException {
  final String name;
  final String message;

  CodolingoException(this.name, this.message);

  @override
  String toString() {
    return "[$name] $message";
  }
}
