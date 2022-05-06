import "package:flutter/material.dart";
import 'package:gmoney/ui/auth/change_mPin.dart';
import 'package:gmoney/ui/dashboard_components/completeKyc/aadhaar_details.dart';
import 'package:gmoney/ui/dashboard_components/completeKyc/updated_agreement.dart';
import 'package:gmoney/ui/dashboard_components/detailed_bank.dart';
import 'package:gmoney/ui/pages/authority_letter_upload.dart';
import 'package:gmoney/ui/pages/group_buy/group_buy_home.dart';
import 'package:gmoney/ui/pages/group_buy/address_confirm.dart';
import 'package:gmoney/ui/pages/group_buy/order_details.dart';
import 'package:gmoney/ui/pages/group_buy/order_placed.dart';
import 'package:gmoney/ui/pages/group_buy/orders_list.dart';
import 'package:gmoney/ui/pages/group_buy/order_confirm.dart';
import 'package:gmoney/ui/pages/home/cart_screen.dart';
import 'package:gmoney/ui/pages/home/home_screen.dart';
import 'package:gmoney/main.dart';
import 'package:gmoney/ui/auth/login_screen.dart';
import 'package:gmoney/ui/auth/mpin_auth.dart';
import 'package:gmoney/ui/auth/mpin_screen.dart';
import 'package:gmoney/ui/dashboard_components/completeKyc/aadhaar_details.dart';
import 'package:gmoney/ui/dashboard_components/completeKyc/bank_details.dart';
import 'package:gmoney/ui/dashboard_components/completeKyc/e_mandate.dart';
import 'package:gmoney/ui/pages/home/home_screen.dart';
import 'package:gmoney/ui/pages/my_emi.dart';
import 'package:gmoney/ui/pages/processing_fee/prcessing_fee.dart';
import 'package:gmoney/ui/permissions_screen.dart';
import 'package:gmoney/ui/splash.dart';
import 'package:gmoney/ui/walkthrough_screens.dart';

import '../ui/TakePictureScreen.dart';
import '../ui/dashboard_components/completeKyc/agreemenet_kyc.dart';
import '../ui/dashboard_components/completeKyc/kyc_complete.dart';
import '../ui/dashboard_components/drawer_widgets/notifications.dart';
import '../ui/dashboard_components/get_approval.dart';
import '../ui/dashboard_components/terms_screen.dart';
import '../ui/dashboard_components/drawer_widgets/faq_screen.dart';
import '../ui/dashboard_components/verify_statement.dart';
import '../ui/pages/equipment_finance/activate_limit.dart';
import '../ui/pages/equipment_finance/statement_option.dart';
import '../ui/pages/equipment_finance/upload_bank_statement.dart';
import '../ui/pages/my_bills/my_bills_details.dart';
import '../ui/pages/my_bills/my_bills_otp.dart';
import '../ui/pages/my_bills/my_bills_screen.dart';
import '../ui/pages/equipment_finance/partner_detail_screen.dart';
import '../ui/pages/supplier/my_bills_tabs.dart';
import '../ui/pages/suppliers/bill_payment_detail.dart';
import '../ui/pages/suppliers/bill_payments.dart';
import '../ui/pages/suppliers/group_buy_order_details.dart';
import '../ui/pages/suppliers/my_suppliers.dart';
import '../ui/pages/suppliers/supplier_payment_detail.dart';
import '../ui/widgets/home/navigation_drawer.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/HomeScreen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/Splash':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/TakePictureScreen':
        return MaterialPageRoute(
            builder: (_) => TakePictureScreen(
                  // camera: cameras.last,
                  camera: cameras.last,
                ));

      case '/NavigationDrawer':
        return MaterialPageRoute(builder: (_) => NavigationDrawer());
      case '/TutorialScreens':
        return MaterialPageRoute(builder: (_) => TutorialScreen());
      case '/PermissionsScreen':
        return MaterialPageRoute(builder: (_) => PermissionsScreen());
      case '/LoginScreen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/CreateMPinScreen':
        return MaterialPageRoute(builder: (_) => NewMPin());
      case '/MyEMIsScreen':
        return MaterialPageRoute(builder: (_) => MyEMIs());
      case '/EMandate':
        return MaterialPageRoute(builder: (_) => EMandate());
      case '/BankDetailsScreen':
        return MaterialPageRoute(builder: (_) => BankDetailsScreen());
      case '/PinAuthScreen':
        return MaterialPageRoute(builder: (_) => PinAuth());
      case '/MyBillsTabs':
        return MaterialPageRoute(builder: (_) => MyBillsTabs());
      case '/AgreementScreen':
        return MaterialPageRoute(builder: (_) => AgreementScreen());
      case '/AgreementUrlScreen':
        return MaterialPageRoute(builder: (_) => NewAgreement());
      case '/ProcessingFeeScreen':
        return MaterialPageRoute(builder: (_) => MyBillsProcessing());
      case '/ChangePinScreen':
        return MaterialPageRoute(builder: (_) => ChangeMPin());
      case '/AadhaarDetails':
        return MaterialPageRoute(builder: (_) => AadhaarDetails());
      case '/BankStatementUpload':
        return MaterialPageRoute(builder: (_) => AuthorityLetterUpload());
      case '/ApprovalScreen':
        return MaterialPageRoute(builder: (_) => ApprovalScreen());
      case '/FAQScreen':
        return MaterialPageRoute(builder: (_) => FAQScreen());
      case '/MyBillsScreen':
        return MaterialPageRoute(builder: (_) => MyBillsScreen());
      case '/Notifications':
        return MaterialPageRoute(builder: (_) => Notifications());
      case '/MyBillsDetails':
        final data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => MyBillsDetails(
                  index: data,
                ));
      case '/MyBillsOtp':
        final data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => MyBillsOtp(
                  id: data,
                ));
      case '/DetailedBank':
        return MaterialPageRoute(builder: (_) => DetailBankScreen());
      case '/VerifyStatement':
        return MaterialPageRoute(builder: (_) => VerifyStatement());
        final data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => MyBillsOtp(
                  id: data,
                ));
      case '/TermsScreen':
        return MaterialPageRoute(builder: (_) => TermsScreen());
      case '/KycCompleteScreen':
        return MaterialPageRoute(builder: (_) => KycCompleteScreen());
      case '/CartScreen':
        return MaterialPageRoute(builder: (_) => CartScreen());
        case '/MySuppliers':
        return MaterialPageRoute(builder: (_) => MySuppliers());
        case '/BillPayments':
        return MaterialPageRoute(builder: (_) => BillPayments());
        case '/BillPaymentsDetails':
        return MaterialPageRoute(builder: (_) => BillPaymentsDetails());
        case '/SupplierPaymentsDetails':
        return MaterialPageRoute(builder: (_) => SupplierPaymentsDetails());
        case '/GBOrderDetails':
        return MaterialPageRoute(builder: (_) => GBOrderDetails());
      case '/StatementUpload':
        return MaterialPageRoute(builder: (_) => BankStatementUpload());
      case '/StatementOption':
        return MaterialPageRoute(builder: (_) => StatementOption());
      case '/GroupBuyHome':
        return MaterialPageRoute(builder: (_) => GroupBuyHome());
      case '/ActivateLimit':
        return MaterialPageRoute(builder: (_) => ActivateLimit());
      case '/PartnerDetails':
        return MaterialPageRoute(builder: (_) => PartnerDetails());
      case '/MyOrders':
        final data = settings.arguments;
        return MaterialPageRoute(builder: (_) => AddressConfirm(data: data,));
      case '/OrderConfirm':
        return MaterialPageRoute(builder: (_) => OrderConfirm());
      case '/GroupBuyOrders':
        return MaterialPageRoute(builder: (_) => OrdersList());
      case '/OrderDetails':
        return MaterialPageRoute(builder: (_) => OrderDetails());
      case '/OrderPlaced':
        return MaterialPageRoute(builder: (_) => OrderPlaced());
      default:
        return MaterialPageRoute(builder: (_) => Splash());
    }
  }
}
