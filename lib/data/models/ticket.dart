class Ticket {
  final int? id;
  final String clientName;
  final String address;
  final DateTime ticketDate;
  Ticket(
      {this.id,
      required this.clientName,
      required this.address,
      required this.ticketDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clientName': clientName,
      'address': address,
      'ticketDate': ticketDate.toIso8601String(),
    };
  }

  static Ticket fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'],
      clientName: map['clientName'],
      address: map['address'],
      ticketDate: DateTime.parse(map['ticketDate']),
    );
  }
}
