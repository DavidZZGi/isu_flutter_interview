import 'package:flutter/scheduler.dart';
import 'package:isu_flutter_interview/core/use_case.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';
import 'package:isu_flutter_interview/domain/repositories/ticket_repository.dart';

class UpdateTicket implements UseCase<Future<bool>, Ticket> {
  final TicketRepository ticketRepository;
  UpdateTicket({required this.ticketRepository});
  @override
  Future<bool> call(Ticket ticket) async =>
      await ticketRepository.updateTicket(ticket);
}
