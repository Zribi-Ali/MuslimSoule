import 'package:demo/rechercheFireBaseGEtData/DataModel.dart';
import 'package:flutter/material.dart';

import 'serviceFireBase.dart';

// ignore: must_be_immutable
class ShowData extends StatefulWidget {
  ShowData({required this.date1, required this.date2, super.key});
  String date1, date2;
  @override
  State<ShowData> createState() => _ShowDataState();
}

class requird {}

class _ShowDataState extends State<ShowData> {
  final _db = ServicesFireBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Data'),
      ),
      body: FutureBuilder(
          future: _db.getTickers(widget.date1, widget.date2),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return cardTicket(snapshot.data![index]);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget cardTicket(Ticket ticket) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white10.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            ticket.image!,
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: MediaQuery.sizeOf(context).width * 0.8,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(ticket.tiketNb!),
              const SizedBox(
                width: 10,
              ),
              Text(ticket.etat!),
            ],
          ),
          Text(ticket.date!),
          Row(
            children: [
              Text(ticket.utilisateur!),
              const SizedBox(
                width: 10,
              ),
              Text(ticket.email!),
            ],
          )
        ],
      ),
    );
  }
}
