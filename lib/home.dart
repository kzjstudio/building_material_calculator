import 'package:building_material_calculator/answer_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController wallLengthController = TextEditingController();
  final TextEditingController wallWidthController = TextEditingController();
  final TextEditingController materialLengthController =
      TextEditingController();
  final TextEditingController materialWidthController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? typeOfMaterial = "Sheets";
  String? unitOfMeasure = 'Inches';

  @override
  void dispose() {
    wallLengthController.dispose();
    wallWidthController.dispose();
    materialLengthController.dispose();
    materialWidthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material calculator'),
      ),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Calculate the amount of matrial you will need for any job',
            style: TextStyle(fontSize: 28),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 120,
                  child: Row(
                    children: [
                      const Text('Sheets'),
                      Radio(
                          value: 'Sheets',
                          groupValue: typeOfMaterial,
                          onChanged: (value) {
                            setState(() {
                              typeOfMaterial = value.toString();
                            });
                          })
                    ],
                  )),
              Container(
                  width: 120,
                  child: Row(
                    children: [
                      const Text('Tiles'),
                      Radio(
                          value: 'Tiles',
                          groupValue: typeOfMaterial,
                          onChanged: (value) {
                            setState(() {
                              typeOfMaterial = value.toString();
                            });
                          })
                    ],
                  )),
              SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      const Text('Blocks'),
                      Radio(
                          value: 'blocks',
                          groupValue: typeOfMaterial,
                          onChanged: (value) {
                            setState(() {
                              typeOfMaterial = value.toString();
                            });
                          })
                    ],
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: 120,
                  child: Row(
                    children: [
                      const Text('Inches'),
                      Radio(
                          value: 'Inches',
                          groupValue: unitOfMeasure,
                          onChanged: (value) {
                            setState(() {
                              unitOfMeasure = value.toString();
                            });
                          })
                    ],
                  )),
              Container(
                  width: 120,
                  child: Row(
                    children: [
                      const Text('Feet'),
                      Radio(
                          value: 'Feet',
                          groupValue: unitOfMeasure,
                          onChanged: (value) {
                            setState(() {
                              unitOfMeasure = value.toString();
                            });
                          })
                    ],
                  )),
              SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      const Text('mm'),
                      Radio(
                          value: 'mm',
                          groupValue: unitOfMeasure,
                          onChanged: (value) {
                            setState(() {
                              unitOfMeasure = value.toString();
                            });
                          })
                    ],
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Enter the size of the wall to get the amount of material needed',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: wallLengthController,
                  decoration: InputDecoration(
                      hintText: 'Wall length in $unitOfMeasure'),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Enter wall length';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: wallWidthController,
                  decoration:
                      InputDecoration(hintText: 'Wall width in $unitOfMeasure'),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Enter  wall width';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:
                      const Text('Enter the size of the material you will use'),
                ),
                TextFormField(
                  controller: materialLengthController,
                  decoration: InputDecoration(
                      hintText: '$typeOfMaterial length in $unitOfMeasure'),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Enter material lenght';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: materialWidthController,
                  decoration:
                      InputDecoration(hintText: '$typeOfMaterial width'),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'Enter material width';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnswerPage(
                                wallheight: double.parse(
                                    wallLengthController.value.text),
                                wallWidth: double.parse(
                                    wallWidthController.value.text),
                                materialLegth: double.parse(
                                    materialLengthController.value.text),
                                materialWidth: double.parse(
                                    materialWidthController.value.text),
                              )));
                    }
                  },
                  child: const Text('Calculate'),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
