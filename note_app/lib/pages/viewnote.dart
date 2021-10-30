import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/components/custom_button.dart';
import 'package:notes_app/services/constants.dart';

class ViewNote extends StatefulWidget {
  ViewNote(this.data, this.time, this.reference);

  final Map data;
  final String time;
  final DocumentReference reference;

  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  String title='';
  String description='';

  // TODO
  CollectionReference reference = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: CustomButton(icon: Icon(Icons.delete_outline),onPressed: deleteNoteInDataBase,),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 15,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.77,
                  color: Color(0xFFF3F4FD),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.data['title']}',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontFamily: 'Noto Sans JP',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Divider(
                          color: Colors.teal.shade100,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SingleChildScrollView(
                              child: Text(
                                '${widget.data['description']}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: kTextColor,
                                  fontFamily: 'Noto Sans JP',
                                ),
                                maxLines: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.time,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: kTextColor,
                                  fontFamily: 'Noto Sans JP',
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.image_outlined),
                                  Icon(Icons.mic_rounded),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(onPressed:() async{
                        },icon: Icon(Icons.edit)),
                        IconButton(onPressed: (){},icon: Icon(Icons.star_border)),
                        IconButton(onPressed: (){},icon: Icon(Icons.share_outlined)),
                        IconButton(onPressed:(){},icon: Icon(Icons.more_vert)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }

  void deleteNoteInDataBase() async{
    await widget.reference.delete();
    Navigator.pop(context);
  }
}
