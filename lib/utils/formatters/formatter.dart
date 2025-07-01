import 'package:intl/intl.dart';

class WeDiveFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'fr_FR', symbol: '€').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 11-git +33 format or a 06 for French phone numbers

    if (phoneNumber.startsWith('06') || phoneNumber.startsWith('07')) {
      return '+33 ${phoneNumber.substring(1, 3)} ${phoneNumber.substring(3, 5)} ${phoneNumber.substring(5, 7)} ${phoneNumber.substring(7, 9)} ${phoneNumber.substring(9)}';
    } else if (phoneNumber.startsWith('+33')) {
      return phoneNumber.replaceFirst('+33', '0');
    }
    return phoneNumber;
  }

  // static String internationalFormatPhoneNumber(String phoneNumber) {
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

  //   String countryCode = '+${digitsOnly.substring(0, 2)}';
  //   digitsOnly = digitsOnly.substring(2);

  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode ');

  //   int i = 0;
  //   while (i < digitsOnly.length) {
  //     int groupLength = 2;
  //     if (i == 0 && countryCode == '+1') {
  //       groupLength = 3;
  //     }

  //     int end = i + groupLength;
  //     formattedNumber.write(digitsOnly.substring(i, end));

  //     if (end < digitsOnly.length) {
  //       formattedNumber.write(' ');
  //     }
  //     i = end;
  //   }
  // }
}
