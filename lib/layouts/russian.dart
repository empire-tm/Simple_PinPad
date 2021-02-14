import 'package:simple_pinpad/models/key_layout.dart';

final List<KeyLayoutModel> russianKeyLayout = [
  KeyLayoutModel(NumpadButtonType.numeric, "1", ""),
  KeyLayoutModel(NumpadButtonType.numeric, "2", "а б в г"),
  KeyLayoutModel(NumpadButtonType.numeric, "3", "д е ж з"),
  KeyLayoutModel(NumpadButtonType.numeric, "4", "и й к л"),
  KeyLayoutModel(NumpadButtonType.numeric, "5", "м н о п"),
  KeyLayoutModel(NumpadButtonType.numeric, "6", "р с т у"),
  KeyLayoutModel(NumpadButtonType.numeric, "7", "ф х ц ч"),
  KeyLayoutModel(NumpadButtonType.numeric, "8", "ш щ ъ ы"),
  KeyLayoutModel(NumpadButtonType.numeric, "9", "ь э ю я"),
  KeyLayoutModel(NumpadButtonType.additional1, "", ""),
  KeyLayoutModel(NumpadButtonType.numeric, "0", "+"),
  KeyLayoutModel(NumpadButtonType.delete, "", "")
];
