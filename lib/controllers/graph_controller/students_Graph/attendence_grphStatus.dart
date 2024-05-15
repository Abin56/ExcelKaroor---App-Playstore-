import 'package:get/get.dart';
import 'package:excelkaroor/controllers/userCredentials/user_credentials.dart';
import 'package:excelkaroor/utils/utils.dart';

class StudentAttendenceGrpghStatus extends GetxController {
  Future<void> fetchStudentAttendence({required String studentID}) async {
    await server
        .collection(UserCredentialsController.batchId ?? "")
        .doc(UserCredentialsController.batchId)
        .collection('classes')
        .doc(UserCredentialsController.classId)
        .collection('Students')
        .doc('jobR56LZouZ4wQvjzX4TcCWeqsj1')
        .collection('MyAttendenceList')
        .get()
        .then((value) async {});
  }
}
