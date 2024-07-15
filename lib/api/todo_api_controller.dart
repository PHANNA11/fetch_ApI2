import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_api_flutter_app/model/post_model.dart';
import 'package:test_api_flutter_app/model/product_model.dart';
import 'package:test_api_flutter_app/model/todos_model.dart';

class FullAPIController {
  String todoUrl = 'https://jsonplaceholder.typicode.com/todos';
  String postsUrl = 'https://jsonplaceholder.typicode.com/posts';
  String products = 'https://fakestoreapi.com/products';
  Future<List<TodosModel>> getTodoList() async {
    try {
      var response = await http.get(Uri.parse(todoUrl));
      if (response.statusCode == 200) {
        return todosModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<PostModel>> getPosts() async {
    try {
      var response = await http.get(Uri.parse(postsUrl));
      if (response.statusCode == 200) {
        return postModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<ProductModel>> getProductList() async {
    try {
      var response = await http.get(Uri.parse(products));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
