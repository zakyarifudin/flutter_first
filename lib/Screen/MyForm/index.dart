import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyForm createState() => _MyForm();

}

class _MyForm extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var description = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Center(
            child : Form(
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
                      print(value);
                      setState(() {
                        description = value;
                      });
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
                          print(description);
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
    );
  }
}



