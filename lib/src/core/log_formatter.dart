class LogFormatter {
  static String wrapText(String text, int maxWidth) {
    List<String> lines = [];
    RegExp regExp = RegExp('(.{1,$maxWidth})(?:s|\$)');
    for (var match in regExp.allMatches(text)) {
      lines.add(match.group(0)!.trim());
    }
    return lines.join('\n');
  }

  static String styledCategory(String category, int width) {
    final line = '═' * (width - category.length + 10);
    return '\n✨═══[ 🚀 ${category.toUpperCase()} 🚀 ]$line✨';
  }
}
