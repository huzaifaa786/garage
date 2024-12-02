class Contact {
  String? id;
  String? username;
  String? profilePic;
  String? lastmessageTime;
  String? unseen;

  Contact(contact) {
    id = contact['id'].toString();
    username = contact['username'] ?? contact['name'];
    profilePic = contact['profilepic'] ?? '';
    lastmessageTime = contact['max_created_at'];
    unseen = contact['unseen_count'];

  }
}