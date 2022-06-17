import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  static String backendUrl = '${dotenv.env['BACKEND_URL']}';



}