import 'package:isu_flutter_interview/core/use_case.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';

import '../../entities/no_params.dart';
import '../../repositories/ticket_repository.dart';

class LoadTickets implements UseCase<Future<List<Ticket>>, NoParams> {
  final TicketRepository ticketRepository;
  LoadTickets({required this.ticketRepository});
  @override
  Future<List<Ticket>> call(NoParams noParams) async =>
      await ticketRepository.getTickets();
}
