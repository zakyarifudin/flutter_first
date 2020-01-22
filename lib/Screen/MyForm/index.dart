import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MyForm extends StatefulWidget {
  @override
  _MyForm createState() => _MyForm();
}

class _MyForm extends State<MyForm> {
  String description;
  double numberFormat;
  String dropdownValue;
  int multiDropdownValue;
  String searchDropdownValue;
  int radioValue;
  DateTime dateValue;
  TimeOfDay timeValue;
  bool isRequiredCheckBox;
  bool isSubmit;
  List<MultiItem> rawData;
  List<MultiItem> multiItemData;
  List<RadioItem> radioItemData;
  List<DropdownMenuItem> searchDropdownItemData;
  List<CheckBoxItem> checkBoxItemData;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // untuk number format currency
  var currController = MoneyMaskedTextController(decimalSeparator: "", precision: 0);

  void initState(){
    super.initState();
    description = '';
    numberFormat = 0;
    dropdownValue = null;
    multiDropdownValue = null;
    searchDropdownValue = null;
    radioValue = null;
    dateValue = DateTime.now();
    timeValue = TimeOfDay.now();
    isRequiredCheckBox = false;
    isSubmit = false;
    rawData = <MultiItem>[
      MultiItem(1, "11111", "AAAA"),
      MultiItem(2, "22222", "BBBB"),
      MultiItem(3, "33333", "CCCC"),
      MultiItem(4, "44444", "DDDD"),
      MultiItem(5, "55555", "AAAA"),
      MultiItem(6, "66666", "BBBB"),
      MultiItem(7, "77777", "CCCC"),
      MultiItem(8, "88888", "DDDD"),
    ];
    multiItemData = [];
    radioItemData = [
      RadioItem(1, "Flutter"),
      RadioItem(2, "React Native")
    ];
    checkBoxItemData = [
      CheckBoxItem(idCheckBoxItem: 3, checkBoxItemName: "Android"),
      CheckBoxItem(idCheckBoxItem: 4, checkBoxItemName: "IOS")
    ];
    // untuk search dropdown
    searchDropdownItemData = [];
    for(int i=0; i < 20; i++) {
      searchDropdownItemData.add(DropdownMenuItem(
        child: Text(
          'test ' + i.toString(),
        ),
        value: 'test ' + i.toString(),
      ));
    }
  }

  List<MultiItem> onChangeDropdown(String value){
    multiItemData = [];
    multiDropdownValue = null;

    rawData.forEach((data) {
      if(data.idItemRelate == value){
        multiItemData.add(data);
      }
    });

    return multiItemData;
  }

  void onChangeRadio(value){
    print(value);
    setState(() {
      radioValue = value;
    });
  }

  void onChangeCheckBox(bool value, CheckBoxItem data){
    data.checked = value;
    print(data.checkBoxItemName);

    bool isChecked = false;

    checkBoxItemData.asMap().forEach((index, item){
      if(data.idCheckBoxItem == item.idCheckBoxItem){
        setState(() {
          checkBoxItemData[index] = data;
        });
        //validasi checkbox saat klik item
        if(data.checked == true){
          isChecked = true;
        }
      }
      //validasi checkbox item yg tidak diklik
      else if(item.checked == true){
        isChecked = true;
      }
    });

    setState(() {
      isRequiredCheckBox = isChecked;
    }); 
  }

  Future<Null> selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dateValue,
        firstDate: DateTime(2020),
        lastDate: DateTime(2021),
    );

    if(picked != null && picked != dateValue){
      print(picked.toString());
      setState(() {
        dateValue = picked;
      });
    }
  }

  Future<Null> selectTime(BuildContext context) async{
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: timeValue,
    );

    if(picked != null && picked != timeValue){
      print(picked.toString());
      setState(() {
        timeValue = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // biar saat keyboard muncul gk ngerize
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("My Form"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: EdgeInsets.all(40),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Description',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            description = value;
                          });
                        },
                      ),
                      TextFormField(
                        controller: currController,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Number Format',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter number';
                          }
                          if(double.parse(value) == 0){
                            return 'Number must be greater than 0';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          print(double.parse(value));
                          setState(() {
                            numberFormat = double.parse(value);
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Dropdown 1 : ")
                      ),
                      Center(
                        child: DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null) {
                              return 'Required';
                            }
                            return null;
                          },
                          hint: Text("Dipilih"),
                          value: dropdownValue,
                          items: <String>['AAAA', 'BBBB', 'CCCC', 'DDDD'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              dropdownValue = value;
                            });
                            onChangeDropdown(value);
                          },
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Dropdown 2 Nested : ")
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: DropdownButtonFormField<int>(
                            validator: (value) {
                              if (value == null) {
                                return 'Required';
                              }
                              return null;
                            },
                            hint: Text("Pilih yang Atas dulu"),
                            value: multiDropdownValue,
                            items: multiItemData.map((MultiItem value) {
                              return DropdownMenuItem<int>(
                                value: value.idItem,
                                child: Text(value.itemName),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                multiDropdownValue = value;
                              });
                            },
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Searchable Dropdown :" + (searchDropdownValue == null && isSubmit == true ? " (Required)" : ""),
                          style: TextStyle(
                            color: searchDropdownValue == null && isSubmit == true ? Colors.red : Colors.black
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          border: Border.all(
                            width: 0.5, 
                            color: searchDropdownValue == null && isSubmit == true ? Colors.red : Colors.black
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SearchableDropdown(
                              items: searchDropdownItemData,
                              value: searchDropdownValue,
                              hint: Text(
                                  'Pilih Satu'
                              ),
                              searchHint: Text(
                                'Pilih Satu',
                                style: TextStyle(
                                  fontSize: 20
                                ),
                              ),
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  searchDropdownValue = value;
                                });
                              },
                              isExpanded: true,
                              underline: Container(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Choose cross platform framework!" + (radioValue == null && isSubmit == true ? " (Required)" : ""),
                              style: TextStyle(
                                color: radioValue == null && isSubmit == true ? Colors.red : Colors.black
                              ),
                            ),
                            Row(
                              children: radioItemData.map((data){
                                return Row(
                                  children: <Widget>[
                                    Radio(value: data.idRadioItem, groupValue: radioValue, onChanged: onChangeRadio),
                                    Text(data.radioItemName)
                                  ],
                                );
                              }).toList()
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Choose your platform below!" + (isRequiredCheckBox == false && isSubmit == true ? " (Required)" : ""),
                            style: TextStyle(
                              color: isRequiredCheckBox == false && isSubmit == true ? Colors.red : Colors.black
                            ),
                          ),
                          Row(
                            children: checkBoxItemData.map((data){
                              return Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: data.checked, 
                                    onChanged: (value) {
                                      onChangeCheckBox(value, data);
                                    }, 
                                    activeColor: Colors.green,
                                  ),
                                  Text(data.checkBoxItemName)
                                ],
                              );
                            }).toList()
                          )
                        ],
                      ),
                      Transform.scale(
                        scale: 0.8,
                        alignment: Alignment.center,  
                        child: Center(
                          child: LiteRollingSwitch(
                            //initial value
                            value: true,
                            textOn: 'Active',
                            textOff: 'Inactive',
                            colorOn: Colors.greenAccent[700],
                            colorOff: Colors.redAccent[700],
                            iconOn: Icons.done,
                            iconOff: Icons.cancel,
                            textSize: 16.0,
                            animationDuration: Duration(milliseconds: 500),
                            onChanged: (bool state) {
                              //Use it to manage the different states
                              print('Current State of SWITCH IS: $state');
                            },
                          ),                         
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: ToggleSwitch(
                            initialLabelIndex: 0,
                            minWidth: 100.0,
                            cornerRadius: 15,
                            activeBgColor: Colors.grey,
                            activeTextColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveTextColor: Colors.white,
                            labels: ['Male', 'Female'],
                            icons: [Icons.accessibility_new, Icons.accessibility],
                            activeColors: [Colors.blue, Colors.pink[200]],
                            onToggle: (index) {
                              print('Toggle switch to: $index');
                            }
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Center(
                          child: Container(
                            height: 70,
                            width: 200,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                // border: Border.all(width: 3, color: Colors.black),
                                gradient: LinearGradient(colors: [
                                  Colors.lightBlue,
                                  Colors.amber
                                ])
                            ),
                            child: Center(
                                child: Text(
                                    "Date : " + dateValue.day.toString() + "-" + dateValue.month.toString() + "-" + dateValue.year.toString(),
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, )
                                )
                            ),
                          ),
                        ),
                        onTap: () {
                          selectDate(context);
                        },
                      ),
                      GestureDetector(
                        child: Center(
                          child: Container(
                            height: 70,
                            width: 200,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                // border: Border.all(width: 3, color: Colors.black),
                                gradient: LinearGradient(colors: [
                                  Colors.orange,
                                  Colors.deepOrange,
                                ])
                            ),
                            child: Center(
                                child: Text(
                                    "Time : " + timeValue.hour.toString() + ":" + timeValue.minute.toString(),
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, )
                                )
                            ),
                          ),
                        ),
                        onTap: () {
                          selectTime(context);
                        },
                      ),
                      Center(
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                          child: Text('Submit', style: TextStyle(color: Colors.white)),
                          color: Colors.blue,
                          splashColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueAccent)
                          ),
                          onPressed: () {
                            setState(() {
                              isSubmit = true;
                            });
                            if (_formKey.currentState.validate()) {
                              print(radioValue);
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Processing Your Data ...')));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MultiItem {
  final int idItem;
  final String itemName;
  final String idItemRelate;

  MultiItem(this.idItem, this.itemName, this.idItemRelate);
}

class RadioItem {
  final int idRadioItem;
  final String radioItemName;

  RadioItem(this.idRadioItem, this.radioItemName);
}

class CheckBoxItem {
  final int idCheckBoxItem;
  final String checkBoxItemName;
  bool checked;

  CheckBoxItem({this.idCheckBoxItem, this.checkBoxItemName, this.checked = false});
}
