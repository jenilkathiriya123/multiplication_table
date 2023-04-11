
import 'package:flutter/material.dart';

import 'Global.dart';

class multiTable extends StatefulWidget {
  const multiTable({Key? key}) : super(key: key);

  @override
  State<multiTable> createState() => _multiTableState();
}

class _multiTableState extends State<multiTable> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            });
          },
          child: Icon(Icons.chevron_left_sharp, size: 40),
        ),
        title: Text(
          "Multiplication Generator",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Global.digit
                .map(
                  (e) => Column(
                    children: Global.multi
                        .map(
                          (i) => Column(
                            children: [
                              Text(
                                "$e * ${i + 1} = ${int.parse(e) * (i + 1)}\n",
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
