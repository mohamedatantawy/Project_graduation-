import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String errormassage;

const  Failure({required this.errormassage});
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
      return  Serverfailure.fromResponse(dioEx.response!.statusCode!, dioEx.response!);
      case DioExceptionType.cancel:
        return Serverfailure(
            errormassage: "Request  with ApiServer is Cancel ");
      case DioExceptionType.connectionError:
        return Serverfailure(
            errormassage: "Connection with Internet with ApiServer ");
      case DioExceptionType.unknown:
        return Serverfailure(
            errormassage: "Unexpectionn Error with ApiServer ");
      default :
       return Serverfailure(
            errormassage: "opps, there was  with ApiServer ");
    }
  
    
  }
  factory Serverfailure.fromResponse(int? statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return Serverfailure(errormassage: response['massage']);
    } else if (statuscode == 404) {
      return Serverfailure(
          errormassage: "Your Request is not found ,please try again.");
    } else if (statuscode == 500) {
      return Serverfailure(errormassage: "Internal server error ,try later");
    } else {
      return Serverfailure(errormassage: "opps, there was an Error ,try later");
    }
  }
}
