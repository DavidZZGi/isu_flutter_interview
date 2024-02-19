part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

class OnSyncCalendar extends CalendarEvent {
  final Event event;
  OnSyncCalendar({required this.event});
}
