import 'package:counter_7/data.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

class MyBudgetForm extends StatefulWidget {
  const MyBudgetForm({super.key});

  @override
  State<MyBudgetForm> createState() => _MyBudgetFormState();
}

class _MyBudgetFormState extends State<MyBudgetForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> typeChoices = <String>['Pemasukan', 'Pengeluaran'];

  // form data (state)
  String name = "";
  double amount = 0.0;
  String type = "Pilih salah satu...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget Form"),
      ),
      // Menambahkan drawer menu
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Budget Baru'),
            Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Contoh: Transportasi",
                          labelText: "Nama Budget",
                          icon: const Icon(Icons.wallet),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama budget tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, right: 50, left: 50),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nomimal",
                          icon: const Icon(Icons.attach_money_outlined),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          ; // dihandle oleh VALIDATOR (karena perlu validasi)
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal budget tidak boleh kosong!';
                          } else {
                            try {
                              double.parse(value);
                              setState(() {
                                amount = double.parse(value);
                              });
                            } on FormatException {
                              return 'Nominal budget harus berupa angka!';
                            }
                            return null;
                          }
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          hintText: "Pilih salah satu...",
                          labelText: "Tipe Budget (Pemasukan / Pengeluaran)",
                          icon: const Icon(Icons.directions_bus_outlined),
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        items: typeChoices
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            type = value!;
                          });
                        },
                        validator: (String? value) {
                          if (!typeChoices.contains(value)) {
                            return "Pilih salah satu!";
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                      ),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ListBudget.budgets.add(Budget(
                                name: name,
                                amount: amount.toDouble(),
                                type: type,
                              ));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Budget anda telah tersimpan!')));
                            }
                          },
                          child: const Text(
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          )),
                    ]),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}