import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excelkaroor/controllers/userCredentials/user_credentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chats/students_chats.dart';

class StudentsGroupsMessagesScreen extends StatelessWidget {
  const StudentsGroupsMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('SchoolListCollection')
            .doc(UserCredentialsController.schoolId)
            .collection(UserCredentialsController.batchId!)
            .doc(UserCredentialsController.batchId!)
            .collection('classes')
            .doc(UserCredentialsController.classId!)
            .collection('ChatGroups')
            .doc('ChatGroups')
            .collection("Students")
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            return ListView(
              children: [
                SizedBox(
                  height: size.height * 0.74,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onLongPress: () async {
                            final firebase = await FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection(UserCredentialsController.batchId!)
                                .doc(UserCredentialsController.batchId)
                                .collection('classes')
                                .doc(UserCredentialsController.classId)
                                .get();
                            if (firebase.data()!['classTeacherdocid'] ==
                                FirebaseAuth.instance.currentUser!.uid) {
                              // ignore: use_build_context_synchronously
                              return showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Alert'),
                                    content: const SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                              'Do you want to Remove this Group ?')
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('ok'),
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection(
                                                  'SchoolListCollection')
                                              .doc(UserCredentialsController
                                                  .schoolId)
                                              .collection(
                                                  UserCredentialsController
                                                      .batchId!)
                                              .doc(UserCredentialsController
                                                  .batchId)
                                              .collection('classes')
                                              .doc(UserCredentialsController
                                                  .classId)
                                              .collection('ChatGroups')
                                              .doc('ChatGroups')
                                              .collection("Students")
                                              .doc(snapshots.data?.docs[index]
                                                  ['docid'])
                                              .delete()
                                              .then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: SizedBox(
                            height: 70,
                            child: ListTile(
                              onTap: () async {
                                final firebase = await FirebaseFirestore
                                    .instance
                                    .collection('SchoolListCollection')
                                    .doc(UserCredentialsController.schoolId)
                                    .collection(
                                        UserCredentialsController.batchId!)
                                    .doc(UserCredentialsController.batchId)
                                    .collection('classes')
                                    .doc(UserCredentialsController.classId)
                                    .get();
                                if (snapshots.data!.docs[index]['teacherId'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid ||
                                    firebase.data()!['classTeacherdocid'] ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return StudentsGroupChats(
                                        groupId: snapshots.data!.docs[index]
                                            ['docid'],
                                        groupName: snapshots.data!.docs[index]
                                            ['groupName'],
                                      );
                                              },));
                                  // Get.off(() => StudentsGroupChats(
                                  //       groupId: snapshots.data!.docs[index]
                                  //           ['docid'],
                                  //       groupName: snapshots.data!.docs[index]
                                  //           ['groupName'],
                                  //     ));
                                } else {
                                  showDialog(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Alert'),
                                        content: const SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text('Sorry you have no access ')
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              leading: const CircleAvatar(
                                radius: 30,
                              ),
                              title: Text(
                                  snapshots.data!.docs[index]['groupName'],
                                  style: const TextStyle(color: Colors.black)),
                              contentPadding:
                                  const EdgeInsetsDirectional.all(1),
                              subtitle: FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection('SchoolListCollection')
                                      .doc(UserCredentialsController.schoolId)
                                      .collection(
                                          UserCredentialsController.batchId!)
                                      .doc(UserCredentialsController.batchId!)
                                      .collection('classes')
                                      .doc(UserCredentialsController.classId!)
                                      .get(),
                                  builder: (context, futuredata) {
                                    if (futuredata.hasData) {
                                      return Row(
                                        children: [
                                          const Text(
                                            'class : ',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            futuredata.data
                                                ?.data()?['className'],
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  }),
                              trailing: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('SchoolListCollection')
                                      .doc(UserCredentialsController.schoolId)
                                      .collection(
                                          UserCredentialsController.batchId!)
                                      .doc(UserCredentialsController.batchId)
                                      .collection('classes')
                                      .doc(UserCredentialsController.classId)
                                      .collection('ChatGroups')
                                      .doc('ChatGroups')
                                      .collection("Students")
                                      .doc(snapshots.data?.docs[index]['docid'])
                                      .collection('Participants')
                                      .doc(FirebaseAuth
                                          .instance.currentUser?.uid)
                                      .snapshots(),
                                  builder: (context, messagesnaps) {
                                    if (messagesnaps.hasData) {
                                      if (messagesnaps.data!
                                              .data()?['messageIndex'] ==
                                          null) {
                                        return const Text('');
                                      } else {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: messagesnaps.data!.data()?[
                                                      'messageIndex'] ==
                                                  0
                                              ? const Text('')
                                              : CircleAvatar(
                                                  radius: 14,
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 118, 229, 121),
                                                  child: Text(
                                                    '${messagesnaps.data!.data()?['messageIndex']}',
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                        );
                                      }
                                    } else {
                                      return const Text('');
                                    }
                                  }),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshots.data!.docs.length),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        });
  }
}

addteacherTopaticipance(String groupId, String groupName,
    {required String teacherParameter}) async {
  log('teacherParameter >>>>>>>>>>>>>> $teacherParameter');
  log("message Calinmggggggg");

  await FirebaseFirestore.instance
      .collection("SchoolListCollection")
      .doc(UserCredentialsController.schoolId)
      .collection(UserCredentialsController.batchId!)
      .doc(UserCredentialsController.batchId)
      .collection('classes')
      .doc(UserCredentialsController.classId)
      .collection('ChatGroups')
      .doc('ChatGroups')
      .collection(groupName)
      .doc(groupId)
      .collection('Participants')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({
    'docid': FirebaseAuth.instance.currentUser!.uid,
    teacherParameter:
        '${UserCredentialsController.teacherModel!.teacherName} T r'
  });
}
