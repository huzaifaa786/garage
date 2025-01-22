import 'package:phone_numbers_parser/phone_numbers_parser.dart';

String parsePhoneNumber(String phoneNumber) {
  //ToDO: Parse the phone number
  print(phoneNumber);
  final PhoneNumber parsedNumber = PhoneNumber.parse(phoneNumber);
  print(parsedNumber.isoCode.name);
  //ToDO: Return the Iso Of Number
  return parsedNumber.isoCode.name;
}