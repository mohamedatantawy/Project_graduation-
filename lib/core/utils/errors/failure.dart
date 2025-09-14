import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String errormassage;

  const Failure({required this.errormassage});
}

class Serverfailure extends Failure {
  Serverfailure({required super.errormassage});
  factory Serverfailure.fromdioerror(DioException dioEx) {
    switch (dioEx.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailure(
            errormassage: "Connection timeout with ApiServer ");
      case DioExceptionType.sendTimeout:
        return Serverfailure(errormassage: "Send timeout with ApiServer ");
      case DioExceptionType.receiveTimeout:
        return Serverfailure(errormassage: "Reciver timeout with ApiServer ");
      case DioExceptionType.badCertificate:
        return Serverfailure(
            errormassage: "badCertificate timeout with ApiServer ");
      case DioExceptionType.badResponse:

        return Serverfailure.fromResponse(
            dioEx.response!.data!, dioEx.response!.statusCode!);
  return Serverfailure(
            errormassage: dioEx.response!.data!['message'] );
      case DioExceptionType.cancel:
        return Serverfailure(
            errormassage: "Request  with ApiServer is Cancel ");
      case DioExceptionType.connectionError:
        return Serverfailure(
            errormassage: "Connection with Internet with ApiServer ");
      case DioExceptionType.unknown:
        return Serverfailure(
            errormassage: "Unexpectionn Error with ApiServer ");
      default:
        return Serverfailure(errormassage: "opps, there was  with ApiServer ");
    }
  }
  factory Serverfailure.fromResponse(dynamic response, int code) {
    if (code == 403 || code == 422) {
      return Serverfailure(errormassage: response['message']);
    } else if (code == 409 || code == 401 || code == 400 || code == 303) {
      return Serverfailure(errormassage: response['message']);
    } else if (code == 404) {
      return Serverfailure(errormassage: response['message']);
    } else {
      return Serverfailure(errormassage: 'There was an Error ,try later ');
    }
  }
}
