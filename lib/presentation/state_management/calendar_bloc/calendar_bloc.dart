import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:isu_flutter_interview/domain/modules/calendar_module/sync_calendar.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final SyncGoogleCalendar syncGoogleCalendar;
  CalendarBloc({required this.syncGoogleCalendar})
      : super(CalendarState(requestStatus: RequestStatus.initial)) {
    on<OnSyncCalendar>(_onSyncCalendar);
  }

  FutureOr<void> _onSyncCalendar(
      OnSyncCalendar event, Emitter<CalendarState> emit) async {
    try {
      final result = await syncGoogleCalendar.call(event.event);
      if (result) {
        emit(CalendarState(requestStatus: RequestStatus.success));
      } else {
        emit(CalendarState(requestStatus: RequestStatus.error));
      }
    } catch (e) {
      emit(CalendarState(requestStatus: RequestStatus.error));
    }
  }
}
