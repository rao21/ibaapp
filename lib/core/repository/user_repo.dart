import 'package:ibaapp/core/network.dart';
import 'package:ibaapp/models/user_model.dart';

class UserRepository {
  final UserApiClient userApiClient;

  UserRepository({required this.userApiClient});

  Future<List<User>> getuser() async {
    return userApiClient.fetchuser();
  }
  Future<List<User>> getUserMoc() async {
    return userApiClient.fetchUserMoc();
  }
}
