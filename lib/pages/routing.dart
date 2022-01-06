import 'package:host_manager/pages/adminpages/admin_sign_in.dart';
import 'package:host_manager/pages/adminpages/admin_sign_up.dart';
import 'package:host_manager/pages/adminpages/customer/admin_customer.dart';
import 'package:host_manager/pages/adminpages/items/admin_items.dart';
import 'package:host_manager/pages/adminpages/newcustomer/admin_new_customer.dart';
import 'package:host_manager/pages/adminpages/ngword/admin_ngword.dart';
import 'package:host_manager/pages/adminpages/order/admin_odaer.dart';
import 'package:host_manager/pages/adminpages/salary/admin_salary.dart';
import 'package:host_manager/pages/adminpages/sales/admin_sales.dart';
import 'package:host_manager/pages/boypages/adverd/boy_adverd.dart';
import 'package:host_manager/pages/boypages/boy_sign_in.dart';
import 'package:host_manager/pages/boypages/boy_sign_up.dart';
import 'package:host_manager/pages/boypages/ngword/boy_ngword.dart';
import 'package:host_manager/pages/boypages/order/boy_order.dart';
import 'package:host_manager/pages/playerpages/adverd/player_adverd.dart';
import 'package:host_manager/pages/playerpages/customer/player_customer.dart';
import 'package:host_manager/pages/playerpages/oder/player_oder.dart';
import 'package:host_manager/pages/playerpages/player_sign_in.dart';
import 'package:host_manager/pages/playerpages/player_sign_up.dart';
import 'package:host_manager/pages/playerpages/user/player_user.dart';
import 'adminpages/adverd/admin_adverd.dart';
import 'adminpages/user/admin_user.dart';
import 'boypages/user/boy_user.dart';
import 'playerpages/nextcustomer/player_next_customer.dart';
import 'playerpages/ngword/player_ngword.dart';

class Routes {
  // ホーム Routes
  static const String home = "/home";
  // Player Routes
  static const String playercustomer = PlayerCustomer.routesName;
  static const String playeruser = PlayerUser.routesName;
  static const String playerorder = PlayerOrder.routesName;
  static const String playersignin = PlayerSignIn.routesName;
  static const String playeradverd = PlayerAdverd.routesName;
  static const String playersignup = PlayerSignUp.routesName;
  static const String playerngword = PlayerNgword.routesName;
  static const String playernextcustomer = PlayerNextCustomer.routesName;
  // Boy Routes
  static const String boyorder = BoyOrder.routesName;
  static const String boyadverd = BoyAdverd.routesName;
  static const String boyuser = BoyUser.routesName;
  static const String boysignin = BoySignIn.routesName;
  static const String boysignup = BoySignUp.routesName;
  static const String boyngword = BoyNgword.routesName;
  // Adimin Routes
  static const String adminuser = AdminUser.routesName;
  static const String adminadverd = AdminAdverd.routesName;
  static const String adminsales = AdminSales.routesName;
  static const String adminsalaty = AdminSalary.routesName;
  static const String adminorder = AdminOrder.routesName;
  static const String adminitems = AdminItems.routesName;
  static const String admincustomer = AdminCusromer.routesName;
  static const String adminsignin = AdminSignIn.routesName;
  static const String adminsignup = AdminSignUp.routesName;
  static const String adminngword = AdminNgword.routesName;
  static const String adminnewcustomer = AdminNewCustomer.routesName;
}
