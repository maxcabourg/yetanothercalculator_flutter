import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String result;
  final String formula;
  const ResultDisplay({Key? key, this.result = '', this.formula = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Row(
          children: [
            Text(
              formula,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              result,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            )
          ],
        )
      ]),
    );
  }
}
