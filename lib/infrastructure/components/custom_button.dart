enum MySize { small, medium, large }

enum ButtonType { primary, secondary, tertiary }

double getButtonHeight(MySize size) {
  switch (size) {
    case MySize.small:
      return 24.0;
    case MySize.medium:
      return 32.0;
    case MySize.large:
      return 40.0;
  }
}

double getFontSize(MySize size) {
  switch (size) {
    case MySize.small:
      return 14.0;
    case MySize.medium:
      return 16.0;
    case MySize.large:
      return 18.0;
  }
}
