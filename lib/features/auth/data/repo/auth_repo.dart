import 'package:dartz/dartz.dart';
import 'package:flutter_nti_task/features/auth/data/models/user_model.dart';

class AuthRepo {
  UserModel? userModel;

  Either<String, void> register({required UserModel user}) {
    try {
      userModel = user;
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Either<String, UserModel> login(
      {required String userName, required String password}) {
    try {
      if (userModel != null) {
        if (userModel!.userName == userName &&
            userModel!.password == password) {
          return Right(userModel!);
        } else {
          throw Exception("Wrong username or password");
        }
      } else {
        throw Exception("You should register first");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
