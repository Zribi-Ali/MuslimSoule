import 'package:demo/Classes/Models/sajdaModel.dart';
import 'package:flutter/material.dart';

Widget SajdaCustomListTile(
    {required Sajda sajda,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sajda.surEnName!,
                    style: const TextStyle(
                      //fontSize: 16,
                      fontWeight: FontWeight.bold,
                      //color: Colors.black,
                    ),
                  ),
                  Text(sajda.revelationType!),
                ],
              ),
              const Spacer(),
              Text(
                sajda.souraName!,
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
