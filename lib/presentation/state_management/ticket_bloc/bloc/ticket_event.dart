part of 'ticket_bloc.dart';

@immutable
sealed class TicketEvent {}

class OnTicketCreate extends TicketEvent {
  final Ticket ticket;
  OnTicketCreate({required this.ticket});
}

class OnLoadTickets extends TicketEvent {}

class OnTicketUpdate extends TicketEvent {
  final Ticket ticket;
  OnTicketUpdate({required this.ticket});
}

class OnTicketDelete extends TicketEvent {
  final int id;
  OnTicketDelete({required this.id});
}
