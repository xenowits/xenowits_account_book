import 'package:contacts_service/contacts_service.dart';
import 'dart:developer' as developer;

import 'package:permission_handler/permission_handler.dart';

void getContacts() async {
  // Get all contacts on device
  var status = Permission.contacts.request();
  developer.log("status", error: status);
  if (await status.isGranted) {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    // developer.log("contacts", error: contacts);
    developer.log("contacts");
    for (var con in contacts) {
      print(con.displayName);
      if (con.phones.isEmpty) print('Phone not available');
      for (var phone in con.phones) {
        print(phone.value);
      }
    }
  } else if (await status.isDenied) {
    developer.log("Contacts permission denied");
  } else if (await status.isPermanentlyDenied) {
    print("Contacts permission permanently denied");
  }
}