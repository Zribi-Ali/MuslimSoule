import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String? id;
  String? cleint_id;
  String? client;
  String? date;
  String? discription;
  String? email;
  String? etat;
  String? image;
  String? objet;
  String? responsable;
  String? tiketNb;
  String? utilisateur;

  Ticket(
      {this.id,
      this.cleint_id,
      this.client,
      this.date,
      this.discription,
      this.email,
      this.etat,
      this.image,
      this.objet,
      this.responsable,
      this.tiketNb,
      this.utilisateur});

  Map<String, dynamic> toJson() => {
        'Cleint_id': cleint_id,
        'Client': client,
        'Date': date,
        'Discription': discription,
        'Email': email,
        'Etat': etat,
        'Image': image,
        'Objet': objet,
        'Responsable': responsable,
        'Tiket': tiketNb,
        'Utilisateur': utilisateur
      };

  Ticket.fromJson(Map<String, dynamic> json)
      : cleint_id = json['Cleint_id'],
        client = json['Client'],
        date = json['Date'],
        discription = json['Discription'],
        email = json['Email'],
        etat = json['Etat'],
        image = json['Image'],
        objet = json['Objet'],
        responsable = json['Responsable'],
        tiketNb = json['TIket'],
        utilisateur = json['Utilisateur'];

  factory Ticket.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Ticket(
        id: document.id,
        cleint_id: data['Cleint_id'],
        client: data['Client'],
        date: data['Date'],
        discription: data['Discription'],
        email: data['Email'],
        etat: data['Etat'],
        image: data['Image'],
        objet: data['Objet'],
        responsable: data['Responsable'],
        tiketNb: data['Tiket'],
        utilisateur: data['Utilisateur']);
  }
}
