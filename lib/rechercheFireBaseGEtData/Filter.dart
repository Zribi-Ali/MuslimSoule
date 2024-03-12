import 'package:flutter/material.dart';

import 'DataModel.dart';
import 'serviceFireBase.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  TextEditingController filterController =
      TextEditingController(); //hath controller 5ali controller ta3ek maysselch
  //Athouma deux array ye5tou type ta3 model ta3ek , ana model ta3i essmo "Ticket"
  List<Ticket> originalData = [];
  List<Ticket> filteredData = [];

//very important: initState hathy hiya bch tkou l'initial ta3 lpage ta3ek
  @override
  void initState() {
    super.initState();
    //ServicesFireBase().getAllTickers() : hathi ana 7at'ha fi file a5er athaka 3leh jebt'ha heka ama enty
    //just 7ot essm l'function eli tjib feha fi les data
    ServicesFireBase().getAllTickers().then((data) {
      setState(() {
        originalData = data;
        filteredData = data;
      });
    });
  }

  //behy hathy function eli bch te5dem lfiltre : hathi 5aleha kif mahiya matbadel feha chay
  void filterData(String query) {
    setState(() {
      //hna 3amlet test Controller vide ou non:: taba3 wa7da wa7da tw tefhemha sahla
      if (query.isNotEmpty) {
        filteredData = originalData
            .where((ticket) =>
                ticket.etat!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredData = originalData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 2),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                //hatha bare de recherche kif eli 3endek, 5ali eli 3endek ** just thabet fi controller
                //w thabet fi onChanged athika 7ott'ha kif hathi
                child: TextField(
                  controller: filterController,
                  onChanged: (value) {
                    filterData(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Filter',
                    hintText: 'Enter filter criteria...',
                  ),
                ),
              ),
              Expanded(
                //hna l'affichage des donnees, bch tchoufha chway hhh mathamech FuturesBulder
                //matetfja3ch 5ater l5edma t5edmet lfoug fi l'function "filterData"
                child: ListView.builder(
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    //hana t7ot kif ma3endek enty kfeh t7eb return ta3ek tkoun ana 3amel Widget feha l5edma
                    return cardTicket(filteredData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
