import 'dart:io';
import 'dart:math';

// Enum for the roles in the p1 assignment
enum UserRole { Traveler, Admin, BusinessOwner }


class User {
  int _id;
  String _name;
  UserRole _role;

  User(this._name, this._role, this._id);

  int get id => _id;
  String get name => _name;
  UserRole get role => _role;

  set name(String name) => _name = name;

  @override
  String toString() {
    return ('ID: $_id, Name: $_name, Role: $_role');
  }
}

class Itinerary {
  int _id;
  String _destination = '';
  List<String> _activities = [];

  Itinerary(this._id,{required String destination, List<String>? activities}) {
    _destination = destination;
    _activities = activities ?? [];
  }

  int get id => _id;
  String get destination => _destination;
  List<String> get activities => _activities;

  set destination(String destination) => _destination = destination;
  set activities(List<String> activities) => _activities = activities;

  @override
  String toString() {
    return 'ID: $_id, Destination: $_destination, Activities: ${_activities.join(", ")}';
  }
}

class Booking {
  int _id = 0;
  int _userId = 0;
  int _itineraryId = 0;

  Booking(this._id,{required int userId, required int itineraryId}){
        _userId = userId;
        _itineraryId = itineraryId;
  }

  int get id => _id;
  int get userId => _userId;
  int get itineraryId => _itineraryId;

  @override
  String toString(){
    return ('Your booking ID: $_id, User ID: $_userId, Itinerary ID: $_itineraryId');
  }
}

List<User> users = [];
List<Itinerary> itineraries = [];
List<Booking> bookings = [];

void displayUsers() {
  print('\n--- User List ---');
  if (users.isEmpty) {
    print('No users found');
  }
  else {
    for (var user in users) {
      print(user);
    }
  }

}

void displayItineraries() {
  print('\n--- Itinerary List ---');
  if (itineraries.isEmpty) {
    print('No itineraries found');
  }
  else {
    for (var itinerarie in itineraries) {
      print(itinerarie);
    }
  }
}

void displayBookings() {
  print('\n--- Booking List ---');
  if (bookings.isEmpty) {
    print('No users found');
  }
  else {
    for (var booking in bookings) {
      print(booking);
    }
  }
}

void addUser() {
  print('Enter user name: ');
  String name = stdin.readLineSync()!;
  print('Choose role: 1. Traveler  2. Admin  3. BusinessOwner');
  int roleChoice = int.parse(stdin.readLineSync()!);
  UserRole role = UserRole.values[roleChoice - 1];
  var id = Random().nextInt(1000);
  users.add(User(name, role,id));
  print('User added successfully');
  print('${users.toString()}');
}

void addItinerary() {
  print('Enter destination: ');
  String destination = stdin.readLineSync()!;

  List<String> activities = [];
  print('Enter activities for the itinerary (type "x" when finished):');
  while (true) {
    stdout.write('Enter activity: ');
    String activity = stdin.readLineSync()!;
    if (activity.toLowerCase() == 'x')
      break;
    activities.add(activity);
  }
  var id = Random().nextInt(1000);
  itineraries.add(Itinerary(id, destination: destination, activities: activities));
  print('Itinerary added successfully');
  print('${itineraries.toString()}');
}

void addBooking() {
  if (users.isEmpty || itineraries.isEmpty) {
    print('Error: Please add users and itineraries first');
    return;
  }
  print('Enter User ID: ');
  int userId = int.parse(stdin.readLineSync()!);
  for(int i=0;i<users.length;i++) {
    if (users[i]._id != userId) {
      print('this id is not available');
      return;
    }
  }
  print('Enter Itinerary ID: ');
  int itineraryId = int.parse(stdin.readLineSync()!);
  for(int i=0;i<itineraries.length;i++) {
    if (itineraries[i]._id != itineraryId) {
      print('this id is not available');
      return;
    }
    else{
    bookings.add(Booking(Random().nextInt(1000), userId: userId, itineraryId: itineraryId));
    print('Booking added successfully');
    }
  }
  print(bookings.toString());
}

void updateUser() {
  if(users.isEmpty) {
    print("no users available");
    return;
  }
  print('Enter User ID to update: ');
  int id = int.parse(stdin.readLineSync()!);
  User? user;
  for (var u in users) {
    if (u.id == id) {
      user = u;
      break;
    }
  }
  if (user == null) {
    print('User not found');
  } else {
    print('User found: ${user.name}');
    print('Enter new name: ');
    user?.name = stdin.readLineSync()!;
    print('User updated successfully');
  }
}

void deleteBooking() {
  if (bookings.isEmpty){
    print("no bookings available");
    return;
  }
  print('Enter booking ID to delete: ');
  int id = int.parse(stdin.readLineSync()!);
  bool found = false;
  for (int i = 0; i < bookings.length; i++) {
    if (bookings[i].id == id) {
      bookings.removeAt(i);
      print('Booking with ID $id deleted successfully');
      found = true;
      break;
    }
  }
  if (!found) {
    print('No booking found with ID $id');
  }
}

void searchUser() {
  if(users.isEmpty) {
    print("no users available");
    return;
  }
    print('Enter User Name to search: ');
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print('Invalid input. Please enter a valid name.');
      return;
    }
    String search = input.toLowerCase();
    bool found = false;
    for (var user in users) {
      if (user.name.toLowerCase().contains(search)) {
        if (!found) {
          print('\nFound the following users:');
          found = true;
        }
        print(user);
      }
    }
    if (!found) {
      print('No users found matching "$input"');
    }
  }


void main() {
  while (true) {
    print('\n-- Smart Travel Management System --');
    print('1. Display Users');
    print('2. Display Itineraries');
    print('3. Display Bookings');
    print('4. Add User');
    print('5. Add Itinerary');
    print('6. Add Booking');
    print('7. Update User Name');
    print('8. Delete Booking');
    print('9. Search User by Name');
    print('10. Exit');
    print('Enter your choice: ');

    try {
      int choice = int.parse(stdin.readLineSync()!);
      switch (choice) {
        case 1:
          displayUsers();
          break;
        case 2:
          displayItineraries();
          break;
        case 3:
          displayBookings();
          break;
        case 4:
          addUser();
          break;
        case 5:
          addItinerary();
          break;
        case 6:
          addBooking();
          break;
        case 7:
          updateUser();
          break;
        case 8:
          deleteBooking();
          break;
        case 9:
          searchUser();
          break;
        case 10:
          print('Exiting program');
          return;
        default:
          print('Invalid choice,, try again');
      }
    }
    catch (e) {
      print('Error: Invalid input');
    }
  }
}
