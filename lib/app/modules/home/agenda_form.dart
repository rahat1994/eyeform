import 'package:eye_form/app/modules/eyeForm/eye_form_page.dart';
import 'package:eye_form/app/modules/home/eye_examination.dart';
import 'package:eye_form/app/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/helpers.dart';

class AgendaForm extends StatefulWidget {
  AgendaForm({Key key}) : super(key: key);

  @override
  _AgendaFormState createState() => _AgendaFormState();
}

class _AgendaFormState extends State<AgendaForm> {
  List _data = List.generate(4, (index) => false);

  List<String> antList = [
    'HAS',
    'DM',
    'Glaucoma',
    'Trauma Ocular',
    'Catarate',
    'Asma Bronquica'
  ];

  List<String> antPesssolas = [];
  List<String> odOeList = [
    'BAV',
    'Hipermia',
    'Prurido',
    'Lacrimejamento',
    'Dor',
    'Trauma',
    'Ardencia',
    'Secrecap'
  ];
  List<String> cilios = ['NL', 'Triqulase', 'Distiqulase', 'Outro'];
  List<String> selectedCiliosOlhoDireito;
  List<String> selectedCiliosOlhoEsquerdo;

  List<String> palp = [
    'NL',
    'Dermatocalase',
    'Entropio Superior',
    'Entropio Inferior',
    'Ectropio Superior',
    'Ectropio Inferior',
  ];
  List<String> selectedPalpOlhoDireito;
  List<String> selectedPalpOlhoEsquerdo;

  List<String> conj = [
    'NL',
    'Hipermia',
    'PTERGIO',
    'PINEGUECULAN',
    'PINGECULAT'
  ];
  List<String> selectedConjOlhoDireito;
  List<String> selectedConjOlhoEsquerdo;

  List<String> cornea = [
    'TRASNP',
    'Afinamento',
    'Halo Senil',
    'Pannus',
    'OPAC EA',
    'OPAC Ep',
    'Leucoma',
    'Edema',
  ];
  List<String> selectedCorneaOlhoDireito;
  List<String> selectedCorneaOlhoEsquerdo;

  List<String> ca = [
    'TRASNP',
    'Afinamento',
    'Halo Senil',
    'Pannus',
    'OPAC EA',
    'OPAC Ep',
    'Leucoma',
    'Edema',
  ];
  List<String> selectedCaOlhoDireito;
  List<String> selectedCaOlhoEsquerdo;

  List<String> iris = [
    'NL',
    'Atrofia',
    'Sinequia Ant',
    'Sinequia Pst',
  ];
  List<String> selectedirisOlhoDireito;
  List<String> selectedirisOlhoEsquerdo;

  List<String> pupula = ['Redinda', 'Oval', 'FR', 'NFR', 'pFR'];
  List<String> selectedpupilaOlhoDireito;
  List<String> selectedpupilaOlhoEsquerdo;

  List<String> christ = ['Transplante', 'CAtarate:N 4+', 'SCP/4+CA 4+'];
  List<String> selectedchristOlhoDireito;
  List<String> selectedchristOlhoEsquerdo;

  List<String> lio = ['Tpoica', 'CA', 'Tiltada', 'OCP 4+'];
  List<String> selectedlioOlhoDireito;
  List<String> selectedlioOlhoEsquerdo;

  // Vitreo
  List<String> vitreo = ['Limpo', 'Turvo /4+', 'DVP Parcial', 'DVP Total'];
  List<String> selectedVitreoOlhoDireito = [];
  List<String> selectedVitreoOlhoEsquerdo = [];

  List<String> retina = ['Colada', 'DR'];
  List<String> selectedRetinaOlhoDireito = [];
  List<String> selectedRetinaOlhoEsquerdo = [];

  List<String> altVasc = [
    'Ausente',
    'Tortuosidade',
    'Afilamento',
    'Vaso fio de cobre',
    'Fio de parata',
    'Fantasma'
  ];
  List<String> selectedaltVascOlhoDireito = [];
  List<String> selectedaltVascOlhoEsquerdo = [];

  List<String> altTecidulas = [
    'E. Duro',
    'E. Mole',
    'M. Hemorr',
    'M. Aburusma',
  ];
  List<String> selectedaltTecidulasOlhoDireito = [];
  List<String> selectedaltTecidulasOlhoEsquerdo = [];

  List<String> macula = [
    'NL',
    'Seca',
    'Edema',
    'EMC',
    'Drusa',
    'Emcs',
    'Outro',
  ];
  List<String> selectedmaculaOlhoDireito = [];
  List<String> selectedmaculaOlhoEsquerdo = [];

  List<String> eprOiho = [
    'NL',
    'Rarefacao',
    'Atrofia',
  ];
  List<String> selectedeprOihoOlhoDireito = [];
  List<String> selectedeprOihoOlhoEsquerdo = [];

  List<String> noOiho = [
    'Carodo',
    'Palidez 4+',
    'Borada nitada',
    'Borda Borrda',
    'Tiltado',
  ];
  List<String> selectednoOihoOlhoDireito = [];
  List<String> selectednoOihoOlhoEsquerdo = [];

  List<String> avlList = ['CC', 'SC'];
  String avl;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
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
                    height: 25,
                  ),
                  patentList(),
                  SizedBox(
                    height: 25,
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      print(index);
                      setState(() {
                        _data[index] = !isExpanded;
                      });
                    },
                    children: [
                      eyeExaminationForm(),
                      bioMicroScopy(),
                      eyeMapping(),
                      complimentaryExams()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  patentList() {
    return Text("Patent list");
  }

  eyeExaminationForm() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Eye Examination Form'),
        );
      },
      body: eyeExaminationPanel(),
      isExpanded: _data[0],
    );
  }

  bioMicroScopy() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Biomicroscopy'),
        );
      },
      body: bioMicroscopyContent(),
      isExpanded: _data[1],
    );
  }

  eyeMapping() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Eye Mapping'),
        );
      },
      body: mapeoMento(),
      isExpanded: _data[2],
    );
  }

  complimentaryExams() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Compimentary Exams'),
        );
      },
      body: ListTile(
          title: Text('item.expandedValue'),
          subtitle: Text('To delete this panel, tap the trash can icon'),
          trailing: Icon(Icons.delete),
          onTap: () {
            // setState(() {
            //   _data.removeWhere((currentItem) => item == currentItem);
            // });
          }),
      isExpanded: _data[3],
    );
  }

  eyeExaminationPanel() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Ant Pessonals'),
              Expanded(
                child: Row(
                  children: [
                    ...antList.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              print(antPesssolas);
                              if (newValue) {
                                setState(() {
                                  antPesssolas.add(e);
                                });
                              } else {
                                setState(() {
                                  antPesssolas.remove(e);
                                });
                              }
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                showErrorToast(msg: 'Input cant be empty');
              }
            },
            decoration: InputDecoration(
              labelText: 'Outra',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
                      labelText: 'Medicacao em uso',
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Text('Allergia'),
              DropdownButton<String>(
                // value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: ColorConstants.blue),
                underline: Container(
                  height: 2,
                  color: ColorConstants.blue,
                ),
                onChanged: (String newValue) {
                  // setState(() {
                  //   dropdownValue = newValue;
                  // });
                },
                items: <String>['SIM', 'NAO']
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
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Ant Pessonals'),
              Expanded(
                child: Row(
                  children: [
                    ...antList.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              print(antPesssolas);
                              if (newValue) {
                                setState(() {
                                  antPesssolas.add(e);
                                });
                              } else {
                                setState(() {
                                  antPesssolas.remove(e);
                                });
                              }
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                showErrorToast(msg: 'Input cant be empty');
              }
            },
            decoration: InputDecoration(
              labelText: 'Outra',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                showErrorToast(msg: 'Input cant be empty');
              }
            },
            decoration: InputDecoration(
              labelText: 'Ant Cirug Oftamologico',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text('QPD',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('OD'),
              Expanded(
                child: Row(
                  children: [
                    ...odOeList.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              if (newValue) {
                                setState(() {
                                  antPesssolas.add(e);
                                });
                              } else {
                                setState(() {
                                  antPesssolas.remove(e);
                                });
                              }
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                showErrorToast(msg: 'Input cant be empty');
              }
            },
            decoration: InputDecoration(
              labelText: 'Outra',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('OE'),
              Expanded(
                child: Row(
                  children: [
                    ...odOeList.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              print(antPesssolas);
                              if (newValue) {
                                setState(() {
                                  antPesssolas.add(e);
                                });
                              } else {
                                setState(() {
                                  antPesssolas.remove(e);
                                });
                              }
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                showErrorToast(msg: 'Input cant be empty');
              }
            },
            decoration: InputDecoration(
              labelText: 'Outra',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(height: 35),
          Text('RX',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 25),
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
                  // indicacao = value;
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'OD',
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
                  // procedente = value;
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'OE',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
            )),
          ]),
          SizedBox(height: 35),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                showErrorToast(msg: 'Input cant be empty');
              }
            },
            decoration: InputDecoration(
              labelText: 'Outra',
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text('AVL',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              ...avlList.map((e) {
                return Expanded(
                  child: Container(
                    width: 100,
                    child: CheckboxListTile(
                      title: Text(e),
                      value: avl == e,
                      onChanged: (newValue) {
                        setState(() {
                          avl = e;
                        });
                        // avl.removeLast();
                        // avl.add(e);
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            height: 15,
          ),
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
                  // pal = value;
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'OD',
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
                  // mae = value;
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'OE',
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
            )),
          ]),
          SizedBox(
            height: 25,
          ),
          Text('PIO',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  // value: resid,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: ColorConstants.blue),
                  underline: Container(
                    height: 2,
                    color: ColorConstants.blue,
                  ),
                  onChanged: (String newValue) {
                    // setState(() {
                    //   // resid = newValue;
                    // });
                  },
                  items: <String>['Sim', 'Nao']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      showErrorToast(msg: 'Input cant be empty');
                      return 'Input cant be empty';
                    }
                    // bairro = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Hprario',
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
                    // cidade = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'OD',
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
                    // uf = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'OE',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text('AR EST',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      showErrorToast(msg: 'Input cant be empty');
                      return 'Input cant be empty';
                    }
                    // bairro = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Hprario',
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
                    // cidade = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'OD',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text('AMSLER',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      showErrorToast(msg: 'Input cant be empty');
                      return 'Input cant be empty';
                    }
                    // bairro = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'OD',
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
                    // cidade = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'OE',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text('VISAO DE CORES',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      showErrorToast(msg: 'Input cant be empty');
                      return 'Input cant be empty';
                    }
                    // bairro = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'OD',
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
                    // cidade = value;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'OE',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  bioMicroscopyContent() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            'BIOMICROSCOPIA DO OLHO DIREITO',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'CILIOS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...cilios.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCiliosOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Palp'),
              Expanded(
                child: Row(
                  children: [
                    ...palp.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedPalpOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Conj'),
              Expanded(
                child: Row(
                  children: [
                    ...conj.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedConjOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Cornea'),
              Expanded(
                child: Row(
                  children: [
                    ...cornea.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCorneaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('CA'),
              Expanded(
                child: Row(
                  children: [
                    ...ca.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Iris'),
              Expanded(
                child: Row(
                  children: [
                    ...iris.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedirisOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Pupila'),
              Expanded(
                child: Row(
                  children: [
                    ...pupula.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedpupilaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Christ'),
              Expanded(
                child: Row(
                  children: [
                    ...christ.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedchristOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Lio'),
              Expanded(
                child: Row(
                  children: [
                    ...lio.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedlioOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          // new row of BioMicroscopia
          Text(
            'BIOMICROSCOPIA DO OLHO Esquerdo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'CILIOS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...cilios.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCiliosOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Palp'),
              Expanded(
                child: Row(
                  children: [
                    ...palp.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedPalpOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Conj'),
              Expanded(
                child: Row(
                  children: [
                    ...conj.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedConjOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Cornea'),
              Expanded(
                child: Row(
                  children: [
                    ...cornea.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCorneaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('CA'),
              Expanded(
                child: Row(
                  children: [
                    ...ca.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Iris'),
              Expanded(
                child: Row(
                  children: [
                    ...iris.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedirisOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Pupila'),
              Expanded(
                child: Row(
                  children: [
                    ...pupula.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedpupilaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Christ'),
              Expanded(
                child: Row(
                  children: [
                    ...christ.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedchristOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Lio'),
              Expanded(
                child: Row(
                  children: [
                    ...lio.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedlioOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  mapeoMento() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            'Mapemento DO OLHO DIREITO',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Vitreo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...vitreo.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedVitreoOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Retina'),
              Expanded(
                child: Row(
                  children: [
                    ...retina.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedRetinaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Alt Vasc'),
              Expanded(
                child: Row(
                  children: [
                    ...altVasc.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedaltVascOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Alt Teciduais'),
              Expanded(
                child: Row(
                  children: [
                    ...altTecidulas.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedaltTecidulasOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Macula'),
              Expanded(
                child: Row(
                  children: [
                    ...macula.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedmaculaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Epr Oiho'),
              Expanded(
                child: Row(
                  children: [
                    ...eprOiho.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedeprOihoOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('N O'),
              Expanded(
                child: Row(
                  children: [
                    ...noOiho.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectednoOihoOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          // new row of Mapemento
          Text(
            'Mapemento DO OLHO Esquerdo',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Vitreo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...vitreo.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedVitreoOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Retina'),
              Expanded(
                child: Row(
                  children: [
                    ...retina.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedRetinaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Alt Vasc'),
              Expanded(
                child: Row(
                  children: [
                    ...altVasc.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedaltVascOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Alt Teciduais'),
              Expanded(
                child: Row(
                  children: [
                    ...altTecidulas.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedaltTecidulasOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Macula'),
              Expanded(
                child: Row(
                  children: [
                    ...macula.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedmaculaOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Epr Oiho'),
              Expanded(
                child: Row(
                  children: [
                    ...eprOiho.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectedeprOihoOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('N O'),
              Expanded(
                child: Row(
                  children: [
                    ...noOiho.map((e) {
                      return Expanded(
                        child: Container(
                          width: 100,
                          child: CheckboxListTile(
                            title: Text(e),
                            value: antPesssolas.indexOf(e) != -1,
                            onChanged: (newValue) {
                              setState(() {
                                selectednoOihoOlhoDireito.add(e);
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
