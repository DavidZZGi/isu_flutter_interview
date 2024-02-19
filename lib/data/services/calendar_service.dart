import 'package:googleapis/calendar/v3.dart';

abstract class ICalendarService {
  Future<bool> syncGoogleCalendar(Event event);
}
