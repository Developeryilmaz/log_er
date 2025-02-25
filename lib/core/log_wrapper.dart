class LogWrapper {
  static List<String> wrapText(String text, int width) {
    List<String> lines = [];
    RegExp regExp = RegExp('(.{1,${width - 10}})(?:\\s|\$)');
    for (var match in regExp.allMatches(text)) {
      lines.add(match.group(0)!.trim());
    }
    return lines;
  }
}
