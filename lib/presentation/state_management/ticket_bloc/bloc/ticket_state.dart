part of 'ticket_bloc.dart';

final class TicketState {}

final class InitialTicketState extends TicketState {}

final class LoadTicketState extends TicketState {
  List<Ticket> tickets;
  LoadTicketState(this.tickets);
}

final class CreateTicketState extends TicketState {}

final class UpdateTicketState extends TicketState {}

final class DeleteTicketState extends TicketState {}

final class ErrorTicketState extends TicketState {
  final String errorMessage;
  ErrorTicketState({required this.errorMessage});
}
