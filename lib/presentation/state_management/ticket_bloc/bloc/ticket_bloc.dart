import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';
import 'package:isu_flutter_interview/domain/entities/no_params.dart';
import 'package:isu_flutter_interview/domain/modules/ticket_module/add_ticket.dart';
import 'package:isu_flutter_interview/domain/modules/ticket_module/delete_ticket.dart';
import 'package:isu_flutter_interview/domain/modules/ticket_module/load_ticket.dart';
import 'package:isu_flutter_interview/domain/modules/ticket_module/update_ticket.dart';
import 'package:meta/meta.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final UpdateTicket updateTicket;
  final AddTicket addTicket;
  final LoadTickets loadTickets;
  final DeleteTicket deleteTicket;
  TicketBloc(
      this.addTicket, this.deleteTicket, this.loadTickets, this.updateTicket)
      : super(InitialTicketState()) {
    on<OnLoadTickets>(_onLoadTickets);
    on<OnTicketCreate>(_onTicketCreate);
    on<OnTicketDelete>(_onTicketDelete);
    on<OnTicketUpdate>(_onTicketUpdate);
  }

  Future<void> _onLoadTickets(
      OnLoadTickets event, Emitter<TicketState> emit) async {
    try {
      final result = await loadTickets.call(NoParams());
      emit(LoadTicketState(result));
    } catch (e) {
      emit(ErrorTicketState(errorMessage: e.toString()));
    }
  }

  Future<void> _onTicketCreate(
      OnTicketCreate event, Emitter<TicketState> emit) async {
    try {
      final result = await addTicket.call(event.ticket);
      if (result) {
        emit(CreateTicketState());
      } else {
        emit(ErrorTicketState(
            errorMessage: 'Something went wrong while creating a ticket'));
      }
    } catch (e) {
      emit(ErrorTicketState(errorMessage: e.toString()));
    }
  }

  Future<void> _onTicketDelete(
      OnTicketDelete event, Emitter<TicketState> emit) async {
    try {
      final result = await deleteTicket.call(event.id);
      if (result) {
        emit(DeleteTicketState());
      } else {
        emit(ErrorTicketState(
            errorMessage: 'Something went wrong while deleting a ticket'));
      }
    } catch (e) {
      emit(ErrorTicketState(errorMessage: e.toString()));
    }
  }

  Future<void> _onTicketUpdate(
      OnTicketUpdate event, Emitter<TicketState> emit) async {
    try {
      final result = await updateTicket.call(event.ticket);
      if (result) {
        emit(UpdateTicketState());
      } else {
        emit(ErrorTicketState(
            errorMessage: 'Something went wrong while updating a ticket'));
      }
    } catch (e) {
      emit(ErrorTicketState(errorMessage: e.toString()));
    }
  }
}
