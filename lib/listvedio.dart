import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/vediolist.dart';

class Vedio extends StatefulWidget {
  const Vedio({super.key});

  @override
  State<Vedio> createState() => _VedioState();
}

class _VedioState extends State<Vedio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('vedioList')),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('videos').get(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('error');
          }
          final user = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('Sample vedio'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return slogin(id: user[index].id);
                    },
                  ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
