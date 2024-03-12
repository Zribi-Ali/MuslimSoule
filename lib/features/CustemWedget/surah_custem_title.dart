import 'package:demo/Classes/Models/surah.dart';
import 'package:flutter/material.dart';

Widget SurahCustomListTile(
    {required Surah surah,
    required BuildContext context,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(14.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3.0)]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .10,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: Text(
                  (surah.number).toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName!,
                    style: const TextStyle(
                      //fontSize: 16,
                      fontWeight: FontWeight.bold,
                      //color: Colors.black,
                    ),
                  ),
                  Text(surah.englisNaleTranslation!),
                ],
              ),
              const Spacer(),
              Text(
                surah.name!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          )
        ],
      ),
    ),
  );
}
