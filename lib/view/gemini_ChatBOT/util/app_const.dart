import 'package:excelkaroor/controllers/chatgpt_Controller/chatgpt_controller.dart';
import 'package:get/get.dart';

final apiControl = Get.put(ChatGPTController());
final String apiKey = apiControl.apikey.value;
const String geminiModel = 'gemini-pro';
const String geminiVisionModel = 'gemini-pro-vision';
