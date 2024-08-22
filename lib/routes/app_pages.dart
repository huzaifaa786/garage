// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:mobilegarage/selectside/selectside_binding.dart';
import 'package:mobilegarage/selectside/selectside_view.dart';
import 'package:mobilegarage/user_app/app/book_service/book_service_binding.dart';
import 'package:mobilegarage/user_app/app/book_service/book_service_view.dart';
import 'package:mobilegarage/user_app/app/car_details/car_details_binding.dart';
import 'package:mobilegarage/user_app/app/car_details/car_details_view.dart';
import 'package:mobilegarage/user_app/app/change_phonenumber/change_phonenumber_binding.dart';
import 'package:mobilegarage/user_app/app/change_phonenumber/change_phonenumber_view.dart';
import 'package:mobilegarage/app/cart/cart_bindings.dart';
import 'package:mobilegarage/app/cart/cart_view.dart';
import 'package:mobilegarage/app/notification/notification_binding.dart';
import 'package:mobilegarage/app/notification/notification_view.dart';
import 'package:mobilegarage/splash/splash_binding.dart';
import 'package:mobilegarage/splash/splash_view.dart';

import 'package:mobilegarage/user_app/app/auth/otp/otp_binding.dart';
import 'package:mobilegarage/user_app/app/auth/otp/otp_view.dart';
import 'package:mobilegarage/user_app/app/auth/signin/signin_bindings.dart';
import 'package:mobilegarage/user_app/app/auth/signin/signin_view.dart';
import 'package:mobilegarage/user_app/app/auth/signup/signup_binding.dart';
import 'package:mobilegarage/user_app/app/auth/signup/signup_view.dart';

import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_binding.dart';
import 'package:mobilegarage/user_app/app/chat_screen/chat_screen_view.dart';
import 'package:mobilegarage/user_app/app/chats_accounts/chats_accounts_binding.dart';
import 'package:mobilegarage/user_app/app/chats_accounts/chats_accounts_view.dart';
import 'package:mobilegarage/user_app/app/garage/garage_binding.dart';
import 'package:mobilegarage/user_app/app/garage/garage_view.dart';
import 'package:mobilegarage/user_app/app/home/home_binding.dart';
import 'package:mobilegarage/user_app/app/home/home_view.dart';
import 'package:mobilegarage/user_app/app/languange/languange_binding.dart';
import 'package:mobilegarage/user_app/app/languange/languange_view.dart';
import 'package:mobilegarage/user_app/app/main/main_binding.dart';
import 'package:mobilegarage/user_app/app/main/main_view.dart';
import 'package:mobilegarage/user_app/app/my_cars/my_cars_binding.dart';
import 'package:mobilegarage/user_app/app/my_cars/my_cars_view.dart';
import 'package:mobilegarage/user_app/app/my_location/my_location_binding.dart';
import 'package:mobilegarage/user_app/app/my_location/my_location_view.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_binding.dart';
import 'package:mobilegarage/user_app/app/order/accapted_order/accapted_order_view.dart';
import 'package:mobilegarage/user_app/app/order/order_binding.dart';
import 'package:mobilegarage/user_app/app/order/order_view.dart';
import 'package:mobilegarage/user_app/app/onboarding/onboarding_binding.dart';
import 'package:mobilegarage/user_app/app/onboarding/onboarding_view.dart';
import 'package:mobilegarage/user_app/app/order_history/order_history_binding.dart';
import 'package:mobilegarage/user_app/app/order_history/order_history_view.dart';
import 'package:mobilegarage/user_app/app/payment/payment_binding.dart';
import 'package:mobilegarage/user_app/app/payment/payment_view.dart';
import 'package:mobilegarage/user_app/app/profile/account_binding.dart';
import 'package:mobilegarage/user_app/app/profile/account_view.dart';
import 'package:mobilegarage/user_app/app/profile/edit_profile/edit_profile_binding.dart';
import 'package:mobilegarage/user_app/app/profile/edit_profile/edit_profile_view.dart';
import 'package:mobilegarage/user_app/app/search/search_binding.dart';
import 'package:mobilegarage/user_app/app/search/search_view.dart';
import 'package:mobilegarage/user_app/app/search_result/searchResult_binding.dart';
import 'package:mobilegarage/user_app/app/search_result/searchResult_view.dart';
import 'package:mobilegarage/user_app/app/select_lang/select_language_binding.dart';
import 'package:mobilegarage/user_app/app/select_lang/select_language_view.dart';
import 'package:mobilegarage/user_app/app/terms/terms_conditions_binding.dart';
import 'package:mobilegarage/user_app/app/terms/terms_conditions_view.dart';
import 'package:mobilegarage/user_app/app/FAQ/faq_binding.dart';
import 'package:mobilegarage/user_app/app/FAQ/faq_view.dart';
import 'package:mobilegarage/user_app/app/aboutus/aboutus_binding.dart';
import 'package:mobilegarage/user_app/app/aboutus/aboutus_view.dart';
import 'package:mobilegarage/user_app/app/privacy/privacy_binding.dart';
import 'package:mobilegarage/user_app/app/privacy/privacy_view.dart';
import 'package:mobilegarage/user_app/app/promotion/promotion_binding.dart';
import 'package:mobilegarage/user_app/app/promotion/promotion_view.dart';
import 'package:mobilegarage/user_app/app/setting/setting_binding.dart';
import 'package:mobilegarage/user_app/app/setting/setting_view.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/app/auth/change_forgot_password/change_forgot_password_binding.dart';
import 'package:mobilegarage/vendor_app/app/auth/change_forgot_password/change_forgot_password_view.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/forgot_otp_verify/forgot_otp_verify.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/forgot_password_binding.dart';
import 'package:mobilegarage/vendor_app/app/auth/forgot_password/forgot_password_view.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_in/signin_binding.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_in/signin_view.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/signup_binding.dart';
import 'package:mobilegarage/vendor_app/app/auth/sign_up/signup_view.dart';
import 'package:mobilegarage/vendor_app/app/avaliable_date/avaliabledate_binding.dart';
import 'package:mobilegarage/vendor_app/app/avaliable_date/avaliabledate_view.dart';
import 'package:mobilegarage/vendor_app/app/banner/banner_binding.dart';
import 'package:mobilegarage/vendor_app/app/banner/banner_view.dart';
import 'package:mobilegarage/vendor_app/app/chat/chat_binding.dart';
import 'package:mobilegarage/vendor_app/app/chat/chat_view.dart';
import 'package:mobilegarage/vendor_app/app/contactus/contactus_binding.dart';
import 'package:mobilegarage/vendor_app/app/contactus/contactus_view.dart';
import 'package:mobilegarage/vendor_app/app/home/home_binding.dart';
import 'package:mobilegarage/vendor_app/app/home/home_view.dart';
import 'package:mobilegarage/vendor_app/app/language/language_binding.dart';
import 'package:mobilegarage/vendor_app/app/language/language_view.dart';
import 'package:mobilegarage/vendor_app/app/map/map_binding.dart';
import 'package:mobilegarage/vendor_app/app/map/map_view.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_binding.dart';
import 'package:mobilegarage/vendor_app/app/notification/notification_view.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_binding.dart';
import 'package:mobilegarage/vendor_app/app/order/orders/orders_view.dart';
import 'package:mobilegarage/vendor_app/app/product/product_form/product_form_binding.dart';
import 'package:mobilegarage/vendor_app/app/product/product_form/product_form_view.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_binding.dart';
import 'package:mobilegarage/vendor_app/app/product/products/products_view.dart';
import 'package:mobilegarage/vendor_app/app/profile/changepassword/changepassword_binding.dart';
import 'package:mobilegarage/vendor_app/app/profile/changepassword/changepassword_view.dart';
import 'package:mobilegarage/vendor_app/app/profile/editprofile.dart/editprofile_binding.dart';
import 'package:mobilegarage/vendor_app/app/profile/editprofile.dart/editprofile_view.dart';
import 'package:mobilegarage/vendor_app/app/sale/sale_binding.dart';
import 'package:mobilegarage/vendor_app/app/sale/sale_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    //////////////////user_app//////////////////
    //TODO:  [Splash Route]
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [selectlang Route]
    GetPage(
      name: AppRoutes.selectlang,
      page: () => const SelectLanguageView(),
      binding: SelectLanguageBinding(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    // //TODO:  [onboaring Route]
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [signup Route]
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupView(),
      binding: SignupBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO:  [Home Route]
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO:  [Account Route]
    GetPage(
      name: AppRoutes.account,
      page: () => const AccountView(),
      binding: AccountBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO:  [Edit Profile Route]
    GetPage(
      name: AppRoutes.editprofile,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [chat Account Route]
    GetPage(
      name: AppRoutes.chats_accounts,
      page: () => const ChatsAccountsView(),
      binding: ChatsAccountsBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => const SigninView(),
      binding: SigninBindings(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO:  [Language Route]
    GetPage(
      name: AppRoutes.language,
      page: () => const LanguangeView(),
      binding: LanguangeBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [chat Screen]
    GetPage(
      name: AppRoutes.chatScreen,
      page: () => ChatScreenView(),
      binding: ChatScreenBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [Order_history Screen]
    GetPage(
      name: AppRoutes.order_history,
      page: () => OrderHistoryView(),
      binding: OrderHistoryBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => SearchView(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => MainView(),
      binding: MainBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const OrderView(),
      binding: OrderBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [Order_history Screen]
    GetPage(
      name: AppRoutes.termscondition,
      page: () => TermsConditionsView(),
      binding: TermsConditionsBinding(),
    ),
    GetPage(
      name: AppRoutes.my_cars,
      page: () => const MyCarsView(),
      binding: MyCarsBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.my_location,
      page: () => const MyLocationView(),
      binding: MyLocationBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartView(),
      binding: CartBindings(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    //TODO:  [Setting Screen]
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingView(),
      binding: SettingBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [FAQ Screen]
    GetPage(
      name: AppRoutes.faq,
      page: () => FaqView(),
      binding: FaqBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [FAQ Screen]
    GetPage(
      name: AppRoutes.privacy,
      page: () => PrivacyView(),
      binding: PrivacyBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [Aboutus Screen]
    GetPage(
      name: AppRoutes.aboutus,
      page: () => AboutusView(),
      binding: AboutusBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [Promotion Screen]
    GetPage(
      name: AppRoutes.promotion,
      page: () => PromotionView(),
      binding: PromotionBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [Change Phone Number Screen]
    GetPage(
      name: AppRoutes.changephonenumber,
      page: () => ChangePhonenumberView(),
      binding: ChangePhonenumberBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [garage Number Screen]
    GetPage(
      name: AppRoutes.garage,
      page: () => GarageView(),
      binding: GarageBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    //TODO:  [book service Screen]
    GetPage(
      name: AppRoutes.bookservice,
      page: () => BookServiceView(),
      binding: BookServiceBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
     //TODO:  [payment Screen]
    GetPage(
      name: AppRoutes.payments,
      page: () => PaymentView(),
      binding: PaymentBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),


    GetPage(
      name: AppRoutes.acceptedorder,
      page: () => AccaptedOrderView(),
      binding: AccaptedOrderBinding(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),

    ////////////////////vendor_app/////////////////////////
    //////////////////! vendor_app///////////////////////////////
    GetPage(
      name: AppRoutes.selectside,
      page: () => const SelectsideView(),
      binding: SelectsideBinding(),
    ),

    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    //* {Sign up Route}
    GetPage(
      name: AppRoutes.vsignup,
      page: () => const VSignupView(),
      binding: VSignUpBinding(),
    ),

    //* {Sign in Route}
    GetPage(
      name: AppRoutes.vsignin,
      page: () => const VSignInView(),
      binding: VSignInBinding(),
    ),

    //* {Forgot Route}
    GetPage(
      name: AppRoutes.forgot_password,
      page: () => const VForgotPasswordView(),
      binding: VForgotPasswordBinding(),
    ),

    //* {Forgot Otp Verify Route}
    GetPage(
      name: AppRoutes.vforgot_otp_verify,
      page: () => const VForgotOtpVerifyView(),
      binding: VForgotPasswordBinding(),
    ),

    //* {Change Forgot Password Route}
    GetPage(
      name: AppRoutes.vchange_forgot_password,
      page: () => const VChangeForgotPasswordView(),
      binding: VChangeForgotPasswordBinding(),
    ),

    //* {Change Password Route}

    //* {Product Form View Route}
    GetPage(
      name: AppRoutes.vproduct_form_view,
      page: () => const ProductFormView(),
      binding: ProductFormBinding(),
    ),

    //* {Order List View Route}
    GetPage(
      name: AppRoutes.vorders_view,
      page: () => const VOrdersView(),
      binding: VOrdersBinding(),
    ),

    GetPage(
      name: AppRoutes.vhome,
      page: () => VHomeView(),
      binding: VHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.veditprofile,
      page: () => const VEditprofileView(),
      binding: VEditprofileBinding(),
    ),
    GetPage(
      name: AppRoutes.vavaliabledate,
      page: () => const AvaliableDateView(),
      binding: AvaliableDateBinding(),
    ),
    GetPage(
      name: AppRoutes.vsale,
      page: () => const SaleView(),
      binding: SaleBinding(),
    ),
    GetPage(
      name: AppRoutes.vchangepassword,
      page: () => const VChangepasswordView(),
      binding: VChangepasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.vnotification,
      page: () => const VNotificationView(),
      binding: VNotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.vchat,
      page: () => const VChatView(),
      binding: VChatBinding(),
    ),

    GetPage(
      name: AppRoutes.vproductlist,
      page: () => const VProductsView(),
      binding: VProductsBinding(),
    ),
    GetPage(
      name: AppRoutes.vmap,
      page: () => VMapView(),
      binding: VMapBinding(),
    ),
    GetPage(
      name: AppRoutes.vbanner,
      page: () => VBannerView(),
      binding: VBannerBinding(),
    ),
    GetPage(
      name: AppRoutes.vcontactus,
      page: () => VContactusView(),
      binding: VContactusBinding(),
    ),
    GetPage(
      name: AppRoutes.vlanguage,
      page: () => const VLanguageView(),
      binding: VLanguageBinding(),
    ),
     GetPage(
      name: AppRoutes.cardetails,
      page: () => CarDetailsView(),
      binding:CarDetailsBinding(),
    ),
     GetPage(
      name: AppRoutes.search_result,
      page: () => const SearchresultView(),
      binding: SearchResultBinding(),
     
    ),
  ];
}
