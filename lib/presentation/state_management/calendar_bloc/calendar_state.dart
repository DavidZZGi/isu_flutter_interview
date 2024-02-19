part of 'calendar_bloc.dart';

enum RequestStatus { initial, loading, success, error }

final class CalendarState {
  RequestStatus requestStatus;
  CalendarState({required this.requestStatus});
}
