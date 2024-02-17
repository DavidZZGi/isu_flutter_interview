import 'package:isu_flutter_interview/data/models/ticket.dart';

abstract class ITicketService {
  Future<bool> deleteTicket(int ticketPos);
  Future<bool> addTicket(Ticket ticket);
  Future<List<Ticket>> getTickets();
  Future<bool> updateTicket(Ticket ticket);
}
