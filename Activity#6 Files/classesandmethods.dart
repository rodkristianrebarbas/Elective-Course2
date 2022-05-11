//Copyright © Rebarbas,RK/Kurisu/Kryss

/*
rebarbasOOP.dart -> Main File
listsandvar.dart -> Import File/Header File
classesandmethods.dart -> Import File/Header File
*/

/*
I create classesandmethods.dart same as listandvar.dart,
to make the main file lines of code smaller.
This file holds the classes and methods which can be used 
to execute the file through main file.
*/

//Imports.....for variables and lists, see listsandvar.dart
import 'listsandvar.dart';
import 'dart:io';

/*
Type of OOP that i use is Inheritance. 
I use extends keyword instead of implements
*/

//MainMenu class -> Derived from BookSystem class
class MainMenu extends BookSystem {
  /*
  System Main Menu....Choose 1 - 8 to invoke the methods in
  BookSystem class...Greater than 8 will provoke the 
  default case in chooseone(int x) method, repeats the
  menu below until the user choose 8, to stop the execution*/
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
  
  /*
  Methods below are used to execute when the user chooses
  through input.
  */
  
  /*Case 1: Show current # of books method.
   I create the int booklen local variable to
   store the length of 'var books' list and to
   print the counting of element in the books
   list*/
  void showcurrentnoofbooks() {
    print("\n|==========Current # of Books==========|");
    int booklen = books.length;
    print("\nThere are $booklen books in total");
    print("\n|======================================|");
  }

  /*Case 2: Show book data method. I use for loop to print
    the elements inside books list*/
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

  /*Case 3: Show books being lend out method. Same as
  showcurrentnoofbooks() method, I create int lendlen
  local variable to store the length of the list 'lentu'
  and to print the length of the list lentu.*/
  void showbooklendout() {
    print("\n|======Current # of books lend out=====|");
    int lendlen = lentu.length;
    print("\nThere are $lendlen currently lend out books");
    print("\n|======================================|");
  }

  /*Case 4: Add book method. I use while loop to capture the index of
  books list and store it through int bkey variable in listsandvar.dart
  . The variable bkey will through in a conditional statement to know if
    the input of the book title exists in the book library or not. If not 
    existent in the book library, it goes to else statement then adds the 
    new book in the books,isbn,author,genre and manybooks lists.*/
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

  /*Case 5: Lend book method. The user will input fname,lname,
    address, book title the the user will borrow and the count of
    the book that the user borrows. The 'lent' int variable stores
    the value that the element of the manybooks list and books list are
    linked together through indexOf() method and input of the user.
    If successful, the lent variable will hold 0 value and goes to the
    else condition. If the user inputs the same book title and count again, it
    will trigger the if(lent<0) condition, thus, the user will get the message in that
    condition. The else condition then manybooks list will get the element of that
    list through 'blend' variable. thus the specific element in manybooks list will become
    0, and it triggers the second if condition below. It adds the value that the user
    inputs in the lentu list through lentuser list. the list lentuser then adds the five
    compacted elements into the lentu list, thus, the user will see the message after
    the lending of new books. Inputting of the same book and count again will notify the
    user and will see the other user borrows the same book that the user wants*/
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

  /*Case 6: Return book method. This method is in reverse
    as the Case 5: above. It removes the elements in the lentu
    list but first it remove the element in the lentuser list.
    It adds the lent variable from 0 to 1, thus, the user will 
    see the message the book is returned. Just choose no#2 
    in the main menu, the user will see the count of books from 0 to 1.
    The user will be notified if the books are returned.*/
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

  /*Case 7: Show user lend book method. It prints the elements
  inside lentu list. The writeln below have the order in firstname through
  # of books as seen here in example [kryss,rebz,loon,Biology,1].
  I use forEach(print) in this method.*/
  void showuserlendbook() {
    print("\n|=========Show user lend book==========|\n");
    stdout.writeln("\n[FirstName,LastName,Address,BookTitle,#OfBook]\n");
    lentu.forEach(print);
    print("\n|======================================|");
  }

  /*Switch case method. The method will execute the choices,
    which has the methods through user input. Inputs greater
    than 8 will trigger the default case until the user chooses
    8 which is to stop the console execution.*/
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
