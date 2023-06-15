enum Languagetype { ENGLISH, UZBEK }

const String ENGLISH = "en";
const String UZBEK = "uz";

extension LanguagetypeExtension on Languagetype {
  String getValue() {
    switch (this) {
      case Languagetype.ENGLISH:
        return ENGLISH;
      case Languagetype.UZBEK:
        return UZBEK;
    }
  }
}
