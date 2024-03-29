import 'package:demo/Classes/Models/qariModel.dart';
import 'package:flutter/material.dart';

class QariCustomTile extends StatefulWidget {
  const QariCustomTile({Key? key, required this.ontap, required this.qari});

  final Qari qari;
  final VoidCallback ontap;

  @override
  State<QariCustomTile> createState() => _QariCustomTileState();
}

class _QariCustomTileState extends State<QariCustomTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 0,
                  color: Colors.black12,
                  offset: Offset(0, 1),
                )
              ]),
          child: Column(
            children: [
              Text(
                widget.qari.name!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
