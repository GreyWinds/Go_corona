import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 90.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);


const kTextFieldInputDecoration = InputDecoration(
                         filled: true,
                         fillColor: Colors.white,
                         hintText: 'Enter Country Name',
                         hintStyle: TextStyle(color: Colors.grey),
                         border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0),),

                        borderSide: BorderSide(color: Colors.orange,width: 2.0)
                         
                       
                         )
                         );