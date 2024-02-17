import 'package:isu_flutter_interview/data/local_db/database_helper.dart';
import 'package:isu_flutter_interview/data/models/ticket.dart';
import 'package:isu_flutter_interview/data/services/ticket_services.dart';

class TicketRepository implements ITicketService {
  final DatabaseHelper databaseHelper;
  final String _ticketTable = 'ticket';
  TicketRepository(this.databaseHelper);

  @override
  Future<bool> addTicket(Ticket ticket) async {
    final result =
        await databaseHelper.insertRecord(ticket.toMap(), _ticketTable);
    if (result == 0) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> deleteTicket(int ticketPos) async {
    final result =
        await databaseHelper.deleteRecordInTable(ticketPos, _ticketTable);
    if (result == 0) {
      return false;
    }
    return true;
  }

  @override
  Future<List<Ticket>> getTickets() async {
    final result = await databaseHelper.getDataFromTable(_ticketTable);

    return [
      for (final {
            'clientName': clientName,
            'address': address,
            'ticketDate': ticketDate,
          } in result)
        Ticket(
            clientName: clientName, address: address, ticketDate: ticketDate),
    ];
  }

  @override
  Future<bool> updateTicket(Ticket ticket) async {
    final result =
        await databaseHelper.updateRecordInTable(ticket.toMap(), _ticketTable);
    if (result == 0) {
      return false;
    }
    return true;
  }
}
