import 'package:cloud_firestore/cloud_firestore.dart';

import 'DataModel.dart';

class ServicesFireBase {
  final _db = FirebaseFirestore.instance;

  Future<List<Ticket>> getTickers(String date1, String date2) async {
    final snapshot = await _db
        .collection("Tickets")
        .where("Date", whereIn: [date1, date2]).get();
    final ticketData =
        snapshot.docs.map((e) => Ticket.fromSnapshot(e)).toList();
    return ticketData;
  }

  Future<List<Ticket>> getAllTickers() async {
    final snapshot = await _db.collection("Tickets").get();
    final ticketData =
        snapshot.docs.map((e) => Ticket.fromSnapshot(e)).toList();
    return ticketData;
  }
}
