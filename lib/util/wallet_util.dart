import 'package:flutter/material.dart';

class WalletUtil {

  static String getShortAddress(String address){
    int length = address.length;
    return address.substring(0,10) + "..."+ address.substring(length-10,length);
  }

}