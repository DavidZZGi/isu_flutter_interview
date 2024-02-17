import 'package:isu_flutter_interview/data/local_db/database_helper.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';
import 'package:isu_flutter_interview/data/services/ticket_services.dart';

class TicketRepository implements ITicketService {
  final DatabaseHelper databaseHelper;
  TicketRepository(this.databaseHelper);

  @override
  void addTicket(Ticket ticket) {
    // TODO: implement addTicket
  }

  @override
  void deleteTicket(int ticketPos) {
    // TODO: implement deleteTicket
  }

  @override
  Future<List<Ticket>> getTickets() {
    // TODO: implement getTickets
    throw UnimplementedError();
  }

  @override
  void updateTicket(Ticket ticket) {
    // TODO: implement updateTicket
  }
}
