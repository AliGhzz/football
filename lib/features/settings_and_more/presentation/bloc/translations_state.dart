part of 'translations_bloc.dart';

class TranslationsState {
  int languageIndex;
  String language;
  Locale locale;

  TranslationsState(this.languageIndex, this.language, this.locale,);

  // Convert TranslationsState to JSON
  Map<String, dynamic> toJson() {
    return {
      'languageIndex': languageIndex,
      'language' : language,
      'locale': locale.languageCode, // Only store the language code of Locale
    };
  }

  // Convert JSON back to TranslationsState
  static TranslationsState fromJson(Map<String, dynamic> json) {
    return TranslationsState(
      json['languageIndex'] ,
      json['language'],
      Locale(json['locale'] ),
    );
  }
}
