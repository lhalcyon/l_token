import 'package:flutter/material.dart';


class NetworkUtil {

  static int getPrivateVersion(Bitcoin bitcoin){
    return bitcoin == Bitcoin.MAIN_NET ? 0x488ade4 : 0x4358394;
  }

  static int getPublicVersion(Bitcoin bitcoin){
    return bitcoin == Bitcoin.MAIN_NET ? 0x0488b21e : 0x043587cf;
  }

  static int p2pkhVersion(Bitcoin bitcoin){
    return bitcoin == Bitcoin.MAIN_NET ? 0 : 0x6f;
  }

  static int p2shVersion(Bitcoin bitcoin){
    return bitcoin == Bitcoin.MAIN_NET ? 0x05 : 0xc4;
  }

}

enum Bitcoin {

  MAIN_NET,TEST_NET

}