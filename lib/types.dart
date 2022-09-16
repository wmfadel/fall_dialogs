part of fall_dialogs;

enum DialogType {
  info,
  warning,
  error,
  success,
}

extension DialogIcon on DialogType {
  String get message {
    switch (this) {
      case DialogType.info:
        return 'Hi there!';
      case DialogType.warning:
        return 'Warning!';
      case DialogType.error:
        return 'Oh snap!';
      case DialogType.success:
        return 'Well done!';
    }
  }

  Color get color {
    switch (this) {
      case DialogType.info:
        return const Color(0xffB8B5FF);
      case DialogType.warning:
        return const Color(0xffFCA652);
      case DialogType.error:
        return const Color(0xffF05454);
      case DialogType.success:
        return const Color(0xff2D6A4F);
    }
  }

  Color get bubbleColor {
    switch (this) {
      case DialogType.info:
        return const Color(0xff7868E6);
      case DialogType.warning:
        return const Color(0xffCC561E);
      case DialogType.error:
        return const Color(0xffAF2D2D);
      case DialogType.success:
        return const Color(0xff004440);
    }
  }

  IconData get icon {
    switch (this) {
      case DialogType.info:
        return Icons.info_outline;
      case DialogType.warning:
        return Icons.warning_amber_rounded;
      case DialogType.error:
        return Icons.error_outline_sharp;
      case DialogType.success:
        return Icons.check_circle_outline;
    }
  }
}
