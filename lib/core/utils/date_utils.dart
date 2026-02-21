import 'package:intl/intl.dart';

class DateUtils {
  static String formatTanggalIndo(String tanggal) {
    try {
      final dt = DateTime.parse(tanggal);
      // Cek apakah locale sudah diinisialisasi
      return DateFormat('d MMMM yyyy', 'id').format(dt);
    } catch (_) {
      return tanggal;
    }
  }

  static String formatJamIndo(String jam) {
    try {
      final dt = DateTime.parse('2000-01-01 $jam');
      return DateFormat('HH:mm', 'id_ID').format(dt);
    } catch (_) {
      return jam;
    }
  }
}
