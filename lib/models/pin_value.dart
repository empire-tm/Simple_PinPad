import 'dart:async';

class PinValueModel {
  int length;
  String value;
  // ignore: close_sinks
  StreamController _streamController = StreamController<String>.broadcast();

  Stream<String> get valueUpdates => _streamController.stream;

  PinValueModel({this.value = "", this.length});

  void addChar(String char) {
    if (this.value.length < this.length) {
      this.value += char;
      _streamController.add(this.value);
    }
  }

  void deleteChar() {
    if (this.value.length > 0) {
      this.value = value.substring(0, this.value.length - 1);
      _streamController.add(this.value);
    }
  }
}
