import 'dart:convert';
import 'dart:io';

abstract class TestResourcesHelper {
  static File getFile(String name) => File('test/test_resources/$name');

  static Future<Map<String, dynamic>> getJsonMock(String fileName) async =>
      jsonDecode(await (getFile(fileName)).readAsString());

  static Future<Map<String, dynamic>> getSessionJson() =>
      getJsonMock('session_mock.json');
}
