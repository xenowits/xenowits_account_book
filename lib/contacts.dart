import 'package:contacts_service/contacts_service.dart';
import 'dart:developer' as developer;

void getContacts() async {
  // Get all contacts on device
  Iterable<Contact> contacts = await ContactsService.getContacts();
  developer.log(contacts.toString());
}