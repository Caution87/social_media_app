import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id; //id of post
  final String uid; //uid of poster
  final String name; //name of poster
  final String username; //username of poster
  final String message; //message of post
  final Timestamp timestamp;
  final int likeCount;
  final List<String> likedBy; //list of users who liked this post
  Post(
      {required this.id,
      required this.likeCount,
      required this.uid,
      required this.name,
      required this.username,
      required this.message,
      required this.timestamp,
      required this.likedBy});

  //convert firestore doc to post obj
  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
        id: doc.id,
        likeCount: doc['likeCount'],
        uid: doc['uid'],
        name: doc['name'],
        username: doc['username'],
        message: doc['message'],
        timestamp: doc['timestamp'],
        likedBy: List<String>.from(doc['likedBy'] ?? []));
  }

  //convert post obj to map to store in firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'username': username,
      'message': message,
      'timestamp': timestamp,
      'likeCount': likeCount,
      'likedBy': likedBy,
    };
  }
}
