class KeyLayoutModel {
  NumpadButtonType type;
  String char;
  String label;
  String value;

  KeyLayoutModel(this.type, this.char, this.label, {this.value});
}

enum NumpadButtonType { numeric, char, delete, additional1, additional2 }
