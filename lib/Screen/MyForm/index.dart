import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyForm createState() => _MyForm();
}

class _MyForm extends State<MyForm> {
  String description;
  String dropdownValue;
  int multiDropdownValue;
  int radioValue;
  DateTime dateValue;
  TimeOfDay timeValue;
  List<MultiItem> rawData;
  List<MultiItem> multiItemData;
  List<RadioItem> radioItemData;
  List<CheckBoxItem> checkBoxItemData;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState(){
    super.initState();
    description = '';
    dropdownValue = null;
    multiDropdownValue = null;
    radioValue = null;
    dateValue = DateTime.now();
    timeValue = TimeOfDay.now();
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
    checkBoxItemData.asMap().forEach((index, item){
      if(data.idCheckBoxItem == item.idCheckBoxItem){
        setState(() {
          checkBoxItemData[index] = data;
        });
      }
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

    if(picked != null && picked != dateValue){
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
                      Center(
                        child: DropdownButton<String>(
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
                          itemHeight: 70,
                        ),
                      ),
                      Center(
                        child: DropdownButton<int>(
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
                          itemHeight: 70,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Choose cross platform framework below!"),
                          Row(
                            children: radioItemData.map((data){
                              return Row(
                                children: <Widget>[
                                  Radio(value: data.idRadioItem, groupValue: radioValue, onChanged: onChangeRadio),
                                  Text(data.radioItemName)
                                ],
                              );
                            }).toList()
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Choose your platform below!"),
                          Row(
                            children: checkBoxItemData.map((data){
                              return Row(
                                children: <Widget>[
                                  Checkbox(value: data.checked, onChanged: (value) {
                                    onChangeCheckBox(value, data);
                                  }, activeColor: Colors.green),
                                  Text(data.checkBoxItemName)
                                ],
                              );
                            }).toList()
                          )
                        ],
                      ),
                      GestureDetector(
                        child: Center(
                          child: Container(
                            height: 70,
                            width: 200,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(width: 3, color: Colors.black),
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
                                border: Border.all(width: 3, color: Colors.black),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueAccent)
                          ),
                          onPressed: () {
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
