import 'package:isu_flutter_interview/core/use_case.dart';

import '../../repositories/ticket_repository.dart';

class DeleteTicket implements UseCase<Future<bool>, int> {
  final TicketRepository ticketRepository;
  DeleteTicket(this.ticketRepository);
  @override
  Future<bool> call(int params) async =>
      await ticketRepository.deleteTicket(params);
}
