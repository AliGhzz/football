extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this; // اگر رشته خالی است، همان را برگردان
    }
    return this[0].toUpperCase() + substring(1);
  }
}
