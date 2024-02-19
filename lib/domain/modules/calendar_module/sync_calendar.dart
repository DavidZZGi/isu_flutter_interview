import 'package:googleapis/calendar/v3.dart';
import 'package:isu_flutter_interview/core/use_case.dart';
import 'package:isu_flutter_interview/domain/repositories/calendar_repository.dart';

class SyncGoogleCalendar implements UseCase<Future<bool>, Event> {
  final CalendarRepository calendarRepository;
  SyncGoogleCalendar({required this.calendarRepository});
  @override
  Future<bool> call(Event params) async =>
      await calendarRepository.syncGoogleCalendar(params);
}
