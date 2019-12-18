import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class ApiService {

  final String baseUrl = "https://jsonplaceholder.typicode.com/";
  final http.Client httpClient = http.Client();
  
  // Get No Auth
  Future<dynamic> getNoAuth(String url) async {

    String _url = baseUrl + url;
    
    return await http.get("$_url")
      .then((http.Response response){
        return response;
      })
      .catchError((onError){
        print(onError);
      });
  }

  Future<dynamic> postNoAuth(dynamic body) async {

    String _url = baseUrl;

    return await http.post("$_url", body: body, 
            headers: {})
      .then((http.Response response){
          return response;
      })
      .catchError((onError){
        print(onError);
      });
  }

  // Get With Auth
  Future<dynamic> get(String url) async {

    String _url = baseUrl + url;
    
    return await http.get("$_url", headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"})
      .then((http.Response response){
        return response;
      })
      .catchError((onError){
        print(onError);
      });
  }


}