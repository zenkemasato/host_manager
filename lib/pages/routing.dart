import 'package:host_manager/pages/adminpages/admin_sign_in.dart';
import 'package:host_manager/pages/adminpages/admin_sign_up.dart';
import 'package:host_manager/pages/adminpages/adverd/admin_adverd.dart';
import 'package:host_manager/pages/adminpages/customer/admin_customer.dart';
import 'package:host_manager/pages/adminpages/items/admin_items.dart';
import 'package:host_manager/pages/adminpages/order/admin_odaer.dart';
import 'package:host_manager/pages/adminpages/salary/admin_salary.dart';
import 'package:host_manager/pages/adminpages/sales/admin_sales.dart';
import 'package:host_manager/pages/boypages/boy_sign_in.dart';
import 'package:host_manager/pages/boypages/boy_sign_up.dart';
import 'package:host_manager/pages/boypages/order/boy_order.dart';
import 'package:host_manager/pages/playerpages/adverd/player_adverd.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer.dart';
import 'package:host_manager/pages/playerpages/ngword/player_ngword.dart';
import 'package:host_manager/pages/playerpages/oder/player_oder.dart';
import 'package:host_manager/pages/playerpages/player_sign_in.dart';
import 'package:host_manager/pages/playerpages/player_sign_up.dart';
import 'package:host_manager/pages/playerpages/user/userpage.dart';

import 'adminpages/ngword/admin_ngword.dart';
import 'adminpages/staff/admin_staff.dart';
import 'adminpages/user/admin_user.dart';
import 'boypages/adverd/boy_adverd.dart';
import 'boypages/user/boy_user.dart';

class Routes {
  // ホーム Routes
  static const String home = "/home";
  // Player Routes
  static const String playercustomer = PlayerCustomer.routesName;
  static const String playeruser = PlayerUser.routesName;
  static const String playeradverd = PlayerAdverd.routesName;
  static const String playerngword = PlayerNgword.routesName;
  static const String playerorder = PlayerOrder.routesName;
  static const String playersignin = PlayerSignIn.routesName;
  static const String playersignup = PlayerSignUp.routesName;
  // Boy Routes
  static const String boyorder = BoyOrder.routesName;
  static const String boyuser = BoyUser.routesName;
  static const String boyngword = BoyOrder.routesName;
  static const String boyadverd = BoyAdverd.routesName;
  static const String boysignin = BoySignIn.routesName;
  static const String boysignup = BoySignUp.routesName;
  // Adimin Routes
  static const String adminuser = AdminUser.routesName;
  static const String adminstuff = AdminStuff.routesName;
  static const String adminsales = AdminSales.routesName;
  static const String adminsalaty = AdminSalary.routesName;
  static const String adminngword = AdminNgword.routesName;
  static const String adminorder = AdminOrder.routesName;
  static const String adminitems = AdminItems.routesName;
  static const String admincustomer = AdminCusromer.routesName;
  static const String adminadvers = AdminAdverd.routesName;
  static const String adminsignin = AdminSignIn.routesName;
  static const String adminsignup = AdminSignUp.routesName;
}
