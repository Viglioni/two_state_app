import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../states/states.dart';
import '../aux_funcs/aux_funcs.dart';


Scaffold HomePage() => Scaffold(
  appBar: AppBar(title: Text("random startup names")),
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[ randomName()])));


Widget randomName() => Column(
  children: [
    generatedName,
    namesCounter,
    getNewNameButton,
]);


final generatedName = useStateWidget(
  "startUpName",
  (startUpName)=>Text(startUpName,style: TextStyle(fontSize: 48)));

final namesCounter = useStateWidget(
  "counter",
  (counter) => Padding(
    padding: EdgeInsets.all(10.0),
    child: Text( "you have read: $counter names",
      style: TextStyle(fontSize: 11 ))));

final getNewNameButton = setStateWidget(
  StateActions.GetNewName,
  (callbackAction) => RaisedButton(
    onPressed: callbackAction,
    color: Colors.purple,
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Get a new name",
        style: TextStyle(fontSize: 30, color: Colors.white)))));






