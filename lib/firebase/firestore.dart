import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Get all documents from a collection
  Future<List<Map<String, dynamic>>> getDocuments(String collectionName) async {
    final collectionRef = _fireStore.collection(collectionName);
    final snapshot = await collectionRef.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
  Future<List<String>> getDocumentNames(String collectionName) async {
    final collectionRef = _fireStore.collection(collectionName);
    final snapshot = await collectionRef.get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }
  Future<List<String>> getDocumentNames1(String collectionName1,String documentName1,String collectionName2) async {

    final collectionRef = _fireStore.collection(collectionName1).doc(documentName1);
    final snapshot = await collectionRef.collection(collectionName2).get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }

  // Get a specific document by ID
  Future<Map<String, dynamic>?> getDocument(String collectionName, String documentId) async {
    final docRef = _fireStore.collection(collectionName).doc(documentId);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      return snapshot.data();
    } else {
      return null;
    }
  }
  Future<String?> getField(String collectionName, String documentId,String field) async {
    final docRef = _fireStore.collection(collectionName).doc(documentId);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      return snapshot.data()?[field][field];
    } else {
      return null;
    }
  }

  // Add a new document with data
  Future<void> addDocument(String collectionName, Map<String, dynamic> data) async {
    final collectionRef = _fireStore.collection(collectionName);
    await collectionRef.add(data);
  }

  // Set data for a specific document
  Future<void> setDocument(String collectionName, String documentId, Map<String, dynamic> data) async {
    final docRef = _fireStore.collection(collectionName).doc(documentId);
    await docRef.set(data);
  }
  Future<void> setDocuments(String collectionName, Map<String, dynamic> data) async {
    final docRef = _fireStore.collection(collectionName);
    await docRef.add(data);
  }
  Future<void> setDocumentNames(String collectionName1,String documentName1,String collectionName2,String documentName2) async {
    final round1 = _fireStore.collection(collectionName1).doc(documentName1);
    round1.collection(collectionName2).doc(documentName2).set({});

  }

  // Update specific fields in a document
  Future<void> updateDocument(String collectionName, String documentId, Map<String, dynamic> data) async {
    final docRef = _fireStore.collection(collectionName).doc(documentId);
    await docRef.update(data);
  }
  //Delete
  void deleteDocumentNames(String collectionName1,String documentName1,String collectionName2,String documentName2) {
    _fireStore.collection(collectionName1).doc(documentName1).collection(collectionName2).doc(documentName2).delete().then((_) {
      //print('Document deleted successfully.');
    }).catchError((error) {
      //print('Failed to delete document: $error');
    });
  }
}