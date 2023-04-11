import 'package:flutter/material.dart';
import 'package:multiplication_table/pages/Global.dart';
import 'package:multiplication_table/pages/table.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'table': (context) => const multiTable(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController text = TextEditingController();
  TextEditingController text2 = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Multiplication Generator",
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: text,
                onSaved: (val) {
                  setState(() {
                    Global.digit.add(val);
                  });
                  print(Global.digit);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter number...";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  focusColor: Colors.black,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  border: const OutlineInputBorder(),
                  hintText: "Enter any number...",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: text2,
                onSaved: (val) {
                  setState(() {
                    Global.digit.add(val);
                  });
                  print(Global.digit);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter number...";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  focusColor: Colors.black,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                  border: const OutlineInputBorder(),
                  hintText: "Enter any number...",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.pushNamed(context, 'table');
                  }
                },
                child: Text(
                  "Generate Multiplication table",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
