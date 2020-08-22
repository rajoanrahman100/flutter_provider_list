import 'package:flutter/foundation.dart';
import 'package:flutterproviderlist/dataclass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider extends ChangeNotifier{

  DataClass _dataClass=DataClass();

  bool isLoading=true;

  setData(DataClass data){
    _dataClass=data;
    isLoading=false;
    notifyListeners();
  }

 DataClass getData(){
    return _dataClass;
  }

  hitAPi()async{
    var response=await http.get("https://5f210aa9daa42f001666535e.mockapi.io/api/categories");

    //pass the response to data class
    final Map parses=json.decode(response.body);


    print("status code::"+response.statusCode.toString());


    DataClass dataClass=DataClass.fromJson(parses);

    return dataClass;
  }

}