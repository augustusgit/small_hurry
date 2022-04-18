import 'package:small_hurry/shopHop/models/category_sub_category.dart';

import 'config.dart';
import 'network_utils.dart';

/// GET method demo
Future<List<Map>> sendGetRequest(String endpoint) async {
  var result = await handleResponse(await getRequest(endpoint));

  // Iterable list = result;
  return result;
  // return list.map((model) => FollowerModel.fromJson(model)).toList();
}

/// POST method demo
Future sendPostRequest(Map req, String endpoint) async {
  return handleResponse(await postRequest(endpoint, req));
}

Future<List<CategorySubCategory>> getCategories() async {
  var result = await handleResponse(await getRequestWithToken('/categories-parent'));

  Iterable list = result;
  return list.map((model) => CategorySubCategory.fromJson(model)).toList();
}
