String getShortName(String fullName) {
  List<String> words = fullName.split(' ');
  String shortName = '';
  for (int i = 0; i < words.length && i < 2; i++) {
    shortName += words[i][0];
  }
  return shortName;
}