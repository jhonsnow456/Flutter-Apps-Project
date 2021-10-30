import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:notes_app/pages/addnote.dart';
import 'package:notes_app/pages/viewnote.dart';
import 'package:notes_app/services/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/components/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference reference = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'My Notes',
          style: TextStyle(color: kTextColor,),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: CustomButton(icon: Icon(Icons.menu),onPressed: (){},),
        actions: [
          Container(
              child: CustomButton(icon: Icon(Icons.search), onPressed: (){},),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator
              .push(context, MaterialPageRoute(builder: (context) => AddNote()))
              .then((value){
                setState((){});
              });
        },
        child: Icon(Icons.add),
        backgroundColor: kTextColor,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: reference.get(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                Map note = snapshot.data!.docs[index].data();
                DateTime createdOn = note['created'].toDate();
                String formattedTime = DateFormat.yMMMd().add_jm().format(createdOn);
                return InkWell(
                  onTap: (){
                    Navigator
                        .push(context, MaterialPageRoute(builder: (context) => ViewNote(note, formattedTime, snapshot.data!.docs[index].reference)))
                        .then((value) {
                          setState(() {});
                        });
                    },
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  child: Text(
                                    '${note['title']}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: kTextColor,
                                      fontFamily: 'Noto Sans JP',
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(onPressed: (){},icon: Icon(Icons.star_border)),
                                    IconButton(onPressed:(){},icon: Icon(Icons.more_vert)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 50,
                              child: Text(
                                '${note['description']}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor,
                                  fontFamily: 'Noto Sans JP',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              formattedTime,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontFamily: 'Noto Sans JP',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}

