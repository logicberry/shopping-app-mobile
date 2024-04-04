import 'package:intl/intl.dart';

class NumberFormatUtil {
  static String formatThousand(double price) {
    final formatter = NumberFormat('#,##0.00', 'en_US');
    return formatter.format(price);
  }
}
