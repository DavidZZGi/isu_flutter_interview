import 'package:isu_flutter_interview/core/use_case.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';

import '../../repositories/ticket_repository.dart';

class AddTicket implements UseCase<Future<bool>, Ticket> {
  final TicketRepository ticketRepository;
  AddTicket({required this.ticketRepository});

  @override
  Future<bool> call(Ticket params) async =>
      await ticketRepository.addTicket(params);
}
