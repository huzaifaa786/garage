import 'package:phone_numbers_parser/phone_numbers_parser.dart';

String parsePhoneNumber(String phoneNumber) {
  final PhoneNumber parsedNumber = PhoneNumber.parse(phoneNumber);
  return parsedNumber.countryCode;
}

String phoneNumberIsoCode(String phoneNumber) {
  final PhoneNumber parsedNumber = PhoneNumber.parse(phoneNumber);
  return parsedNumber.isoCode.name;
}