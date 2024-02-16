import 'package:isu_flutter_interview/data/models/ticket.dart';

abstract class TicketService {
  void deleteTicket(int ticketPos);
  void addTicket(Ticket ticket);
  Future<List<Ticket>> getTickets();
  void updateTicket(Ticket ticket);
}
