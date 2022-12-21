import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  const GetUserName({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //LEE LA COLECION
    CollectionReference user = FirebaseFirestore.instance.collection('cuentas');
    return FutureBuilder<DocumentSnapshot> (
      future: user.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as  Map<String, dynamic>;
          return Text('Nombre de Usuario:  ${data['first name']}  ${data['last name']} , ${data['user profile']}');
        } else {
          return const Text('cargando...');
        }
      }),
    );
  }
}
