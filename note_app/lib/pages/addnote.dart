import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/services/constants.dart';
import 'package:notes_app/components/custom_button.dart';

class AddNote extends StatefulWidget {
  // const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String title='';
  String description='';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: CustomButton(icon: Icon(Icons.arrow_back_ios), onPressed: addNotesToDatabase,),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 15,),
              Container(
                color: Color(0xFFF3F4FD),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Title',
                            ),
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontFamily: 'Noto Sans JP',
                            ),
                            onChanged: (_value){
                              title = _value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Note Description',
                            ),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: kTextColor,
                              fontFamily: 'Noto Sans JP',
                            ),
                            onChanged: (_value){
                              description = _value;
                            },
                            maxLines: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.star_border),
                      Icon(Icons.share_outlined),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }


  void addNotesToDatabase() async{
    CollectionReference reference = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes');

    var notesData = {
      'title': title,
      'description': description,
      'created': DateTime.now(),
    };

    reference.add(notesData);

    Navigator.pop(context);
  }
}
