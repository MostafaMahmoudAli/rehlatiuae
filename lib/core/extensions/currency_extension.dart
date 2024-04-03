import 'package:currency_converter/currency.dart';

extension CurrencyExtension on Currency {
  String? getCountryName() {
    return AllCurrency.allCurrencyWithCountries[name];
  }
}
