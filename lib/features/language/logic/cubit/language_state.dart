part of 'language_cubit.dart';

class LanguageState {
  final String currentLocale;
  final List<Locale> supportedLocales;

  const LanguageState({
    this.currentLocale = 'en',
    this.supportedLocales = const [
      Locale('en'),
      Locale('ar'),
    ],
  });

  LanguageState copyWith({
    String? currentLocale,
    List<Locale>? supportedLocales,
  }) {
    return LanguageState(
      currentLocale: currentLocale ?? this.currentLocale,
      supportedLocales: supportedLocales ?? this.supportedLocales,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentLocale': currentLocale,
    };
  }

  factory LanguageState.fromJson(Map<String, dynamic> json) {
    return LanguageState(
      currentLocale: json['currentLocale'] ?? 'en',
    );
  }
}

