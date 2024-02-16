class Ticket {
  final String clientName;
  final String address;
  final DateTime ticketDate;
  Ticket(
      {required this.clientName,
      required this.address,
      required this.ticketDate});

  Map<String, dynamic> toMap() {
    return {
      'clientName': clientName,
      'address': address,
      'ticketDate': ticketDate
          .toIso8601String(), // Convertir la fecha a un formato de cadena ISO 8601
    };
  }

  static Ticket fromMap(Map<String, dynamic> map) {
    return Ticket(
      clientName: map['clientName'],
      address: map['address'],
      ticketDate: DateTime.parse(
          map['ticketDate']), // Convertir la cadena ISO 8601 a DateTime
    );
  }
}
