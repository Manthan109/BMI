import 'package:flutter/material.dart';
import 'dart:math';


class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController=new TextEditingController();
  final TextEditingController _ageController = new TextEditingController();
  double _result=0.0;
  String _bmi="";

  void Calculate(){
    setState(() {
      int age = int.parse(_ageController.text);
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      if((_ageController.toString().isNotEmpty && age>0)||(_weightController.toString().isNotEmpty && weight>0)||(_heightController.toString().isNotEmpty && height>0)){
        _result = (703*weight)/pow(height*12,2);
      }
      if(_result>25.0 && _result<29.9){
        _bmi="Overweight";
      }else if(_result>18.5 && _result<25.0)
      {
        _bmi="Healthy";
      }else if(_result>29.9 ){
        _bmi="Obese";
      }else{
        _bmi="Underweight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade200,
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            padding: EdgeInsets.all(5.0),
            children: <Widget>[
              Image.asset(
                "images/bmilogo.png",
                height: 90,
                width: 90,
              ),
              new Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  color: Colors.grey.shade300,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Age",
                          hintText: "Enter Your Age",
                          icon: Icon(Icons.person_outline)
                        ),
                      ),
                      TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Height",
                            hintText: "In Feet E.g 5.7",
                            icon: Icon(Icons.insert_chart)
                        ),
                      ),
                      TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Weight",
                            hintText: "In Lbs",
                            icon: Icon(Icons.line_weight)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(

                          child: Text("Calculate",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                          color: Colors.pink,
                          onPressed: Calculate,
                        ),
                      ),


                    ],
                  )),
              Center(
                  child:Text("Your BMI is ${_result.toStringAsFixed(1)}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 25.0,
                  ),)
              ),
              Center(
                  child:Text("$_bmi",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 20.0,
                  ),)
              )

            ],
          )),
    );
  }
}
