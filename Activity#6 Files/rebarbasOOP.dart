/*
Rod Kristian J. Rebarbas
BSCpE 3A
PEC 02 - Cognate/Elective Course 2
Activity #6 - OOP with Dart
*/

/*
rebarbasOOP.dart -> Main File
listsandvar.dart -> Import File/Header File
classesandmethods.dart -> Import File/Header File
*/

//Imports.....for variables and lists, see listsandvar.dart
//for class and methods, see classesandmethods.dart
import 'dart:core';
import 'classesandmethods.dart';

//Main code
void main(List<String> args) {
  //Creating object mm to access the MainMenu class
  MainMenu mm = new MainMenu();
  //Object mm accessing the menu method from MainMenu class
  mm.menu();
}
