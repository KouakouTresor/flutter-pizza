import 'dart:convert';
import 'package:my_app/models/pizza.dart';
import 'package:http/http.dart' as http;


class PizzeriaService {

  static final String uri = 'http://192.168.1.17:8888/api';

  Future<List<Pizza>> fetchPizzas() async {
    List<Pizza> list = [];

    try{

      final response = await http
          .get(Uri.parse('${uri}/pizzas'));
      //if(response.statusCode == 200)
      if(response.statusCode == 200){
        var json = jsonDecode(utf8.decode(response.bodyBytes));
        for(final value in json){
          list.add(Pizza.fromJson(value));
        }
      } else {
        throw Exception('Impossible de récupérer les pizzas');
      }
    } catch (e){
      throw e;
    }
    return list;
  }
}