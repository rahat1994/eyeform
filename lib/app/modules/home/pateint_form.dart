import 'package:eye_form/app/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/helpers.dart';

class PateintForm extends StatefulWidget {
  PateintForm({Key key}) : super(key: key);

  @override
  _PateintFormState createState() => _PateintFormState();
}

class _PateintFormState extends State<PateintForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String dropdownValue;
  String estCivil;
  String resid;
  String rua;
  String bairro;
  String cidade;
  String uf;
  String pal;
  String mae;
  String profissao;
  String indicacao;
  String procedente;
  String natural;

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      showErrorToast(msg: 'Input cant be empty');
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Name Completo',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: MaterialButton(
                    color: ColorConstants.blue,
                    textColor: Colors.white,
                    onPressed: () => _selectDate(context),
                    child: Text('Nascimento'),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: ColorConstants.blue),
                      underline: Container(
                        height: 2,
                        color: ColorConstants.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    DropdownButton<String>(
                      value: estCivil,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: ColorConstants.blue),
                      underline: Container(
                        height: 2,
                        color: ColorConstants.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          estCivil = newValue;
                        });
                      },
                      items: <String>['option_1', 'option_2']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        width: 100,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              showErrorToast(msg: 'Input cant be empty');
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Rua',
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      width: 100,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            showErrorToast(msg: 'Input cant be empty');
                            return 'Input cant be empty';
                          }
                          bairro = value;
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Bairro',
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      width: 100,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            showErrorToast(msg: 'Input cant be empty');
                          }
                          cidade = value;
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Cidade',
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                      width: 100,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            showErrorToast(msg: 'Input cant be empty');
                          }
                          uf = value;
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'UF',
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                      child: DropdownButton<String>(
                        value: resid,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: ColorConstants.blue),
                        underline: Container(
                          height: 2,
                          color: ColorConstants.blue,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            resid = newValue;
                          });
                        },
                        items: <String>['Urban', 'Rural']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          showErrorToast(msg: 'Input cant be empty');
                        }
                        pal = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Rua',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          showErrorToast(msg: 'Input cant be empty');
                        }
                        mae = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Mae',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          showErrorToast(msg: 'Input cant be empty');
                        }
                        profissao = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Profissao',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  )),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          showErrorToast(msg: 'Input cant be empty');
                        }
                        indicacao = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Indicacao',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          showErrorToast(msg: 'Input cant be empty');
                        }
                        procedente = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Procendente',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    width: 100,
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          showErrorToast(msg: 'Input cant be empty');
                        }

                        natural = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Natural',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                  )),
                ]),
                SizedBox(height: 30),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: MaterialButton(
                    color: ColorConstants.blue,
                    textColor: Colors.white,
                    onPressed: () {},
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
