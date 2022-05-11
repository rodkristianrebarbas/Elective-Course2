--Copyright © Rebarbas,RK/Kurisu/Kryss

/*
rebarbasOOP.dart -> Main File
listsandvar.dart -> Import File/Header File
classesandmethods.dart -> Import File/Header File
*/

//Imports.....for variables and lists, see listsandvar.dart
import 'listsandvar.dart';
import 'dart:io';

//OOP type: Inheritance
//MainMenu class -> Derived from BookSystem class
class MainMenu extends BookSystem {
  //System Menu
  void menu() {
    do {
      print("\n|============LIBRARY SYSTEM============|");
      print("\n[1]How many books it has");
      print("[2]What books it has");
      print("[3]How many books currently lent out?");
      print("[4]Add book");
      print("[5]Lend book");
      print("[6]Return book");
      print("[7]Show user lend book");
      print("[8]Exit");
      print("\n|======================================|");
      print("\nEnter number to choose: ");
      chooser = stdin.readLineSync();
      choose = int.parse(chooser);
      chooseone(choose);
      print("\n|======================================|");
    } while (choose > 9 || choose < 9);
  }
}

//BookSystem class -> Base class
class BookSystem {
  //Case 1: Show current # of books method
  void showcurrentnoofbooks() {
    print("\n|==========Current # of Books==========|");
    int booklen = books.length;
    print("\nThere are $booklen books in total");
    print("\n|======================================|");
  }

  //Case 2: Show book data method
  void showbookdata() {
    print("\n|================Books=================|\n");
    stdout.writeln(
        "/    Books    /    Author    /    ISBN    /    Genre    /    # of book    /\n");
    for (int i = 0; i < books.length; i++) {
      stdout.writeln(
          "/    ${books[i]}    /    ${author[i]}    /    ${isbn[i]}    /    ${genre[i]}    /    ${manybooks[i]}    /");
    }
    print("\n|======================================|");
  }

  //Case 3: Show books being lend out method
  void showbooklendout() {
    print("\n|======Current # of books lend out=====|");
    int lendlen = lentu.length;
    print("\nThere are $lendlen currently lend out books");
    print("\n|======================================|");
  }

  //Case 4: Add book method
  void addbooks() {
    print("\n|==============Add books===============|");
    stdout.writeln("\nBook Title: ");
    book = stdin.readLineSync();

    int i = 0;
    while (i < books.length) {
      if (book == books[i]) {
        bkey = books.indexOf(books[i]);
      }
      i++;
    }

    if (bkey == books.indexOf(book)) {
      print("\n|======================================|");
      print("\nBook title existed in library");
      print("\n|======================================|");
    } else {
      books.add(book);
      stdout.writeln("\nBook Author: ");
      auth = stdin.readLineSync();
      author.add(auth);
      stdout.writeln("\nBook ISBN: ");
      isbnyr = stdin.readLineSync();
      isbn.add(isbnyr);
      stdout.writeln("\nBook Genre: ");
      bkgenre = stdin.readLineSync();
      genre.add(bkgenre);
      stdout.writeln("\nBook Count(Enter 1 only): ");
      mnybk = stdin.readLineSync();
      manybk = int.parse(mnybk);
      manybooks.add(manybk);

      print("\nBook $book added to the library");
      print("\n|======================================|");
    }
  }

  //Case 5: Lend book method
  void lendbooks() {
    print("\n|=============Lend books===============|");
    stdout.writeln("\nEnter first name: ");
    fname = stdin.readLineSync();
    stdout.writeln("\nEnter last name: ");
    ltname = stdin.readLineSync();
    stdout.writeln("\nEnter Address: ");
    addr = stdin.readLineSync();
    stdout.writeln("\nWhat book should you borrow?: ");
    bklend = stdin.readLineSync();
    blend = books.indexOf(bklend);
    stdout.writeln("\nHow many book should you borrow?(Enter 1 only): ");
    bklent = stdin.readLineSync();
    blent = int.parse(bklent);
    lent = manybooks.elementAt(blend) - blent;
    if (lent < 0) {
      print("\nBook $bklend borrowed by ${lentuser[0]}");
    } else {
      manybooks[blend] = lent;
    }
    if (lent == 0 || lent >= manybooks.elementAt(blend)) {
      lentuser = [];
      lentuser.add(fname);
      lentuser.add(ltname);
      lentuser.add(addr);
      lentuser.add(bklend);
      lentuser.add(blent);
      lentu.add(lentuser);

      print("\nBook $bklend lended to ${lentuser[0]}");
    }
    print("\n|======================================|");
  }

  //Case 6: Return book method
  void returnbooks() {
    print("\n|===========Return books===============|");
    stdout.writeln("\nEnter first name: ");
    fname = stdin.readLineSync();
    stdout.writeln("\nEnter last name: ");
    ltname = stdin.readLineSync();
    stdout.writeln("\nEnter Address: ");
    addr = stdin.readLineSync();
    stdout.writeln("\nWhat book should you return?: ");
    bklend = stdin.readLineSync();
    blend = books.indexOf(bklend);
    stdout.writeln("\nHow many book should you return?(Enter 1 only): ");
    bklent = stdin.readLineSync();
    blent = int.parse(bklent);
    lent = manybooks.elementAt(blend) + blent;
    if (lent > 1) {
      print("\nBook $bklend now returned, $bklend ready to lent");
    } else {
      manybooks[blend] = lent;
    }
    if (lent == 1 || lent <= manybooks.elementAt(blend)) {
      lentuser.remove(fname);
      lentuser.remove(ltname);
      lentuser.remove(addr);
      lentuser.remove(bklend);
      lentuser.remove(blent);
      lentu.remove(lentuser);

      print("\n${bklend} returned to the library");
    }
    print("\n|======================================|");
  }

  //Case 7: Show user lend book method
  void showuserlendbook() {
    print("\n|=========Show user lend book==========|\n");
    stdout.writeln("\n[FirstName,LastName,Address,BookTitle,#OfBook]\n");
    lentu.forEach(print);
    print("\n|======================================|");
  }

  //Switch case method
  void chooseone(int x) {
    //Every choose goes to the methods
    switch (choose) {
      //Case 1: Goes to show current # of books method
      case 1:
        showcurrentnoofbooks();
        break;
      //Case 2: Goes to show book data method
      case 2:
        showbookdata();
        break;
      //Case 3: Goes to show book lend out method
      case 3:
        showbooklendout();
        break;
      //Case 4: Goes to add book method
      case 4:
        addbooks();
        break;
      //Case 5: Goes to lend book method
      case 5:
        lendbooks();
        break;
      //Case 6: Goes to return method
      case 6:
        returnbooks();
        break;
      //Case 7: Goes to show user lend book method
      case 7:
        showuserlendbook();
        break;
      //Case 8: exit console
      case 8:
        exit(0);
      //triggers default if choices > 8
      default:
        print("\nOut of choices above");
    }
  }
}
