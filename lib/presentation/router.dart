import 'package:flutter/material.dart';
import 'package:residente_app/presentation/admin/screen/admin_home_screen.dart';
import 'package:residente_app/presentation/auth/screen/forgot_password_screen.dart';
import 'package:residente_app/presentation/auth/screen/login_screen.dart';
import 'package:residente_app/presentation/guard/menu/screens/guard_menu_screen.dart';
import 'package:residente_app/presentation/guard/menu/widgets/part_visits.dart';
import 'package:residente_app/presentation/guard/mobile_scanner/screens/QRScan_screen.dart';
import 'package:residente_app/presentation/incidents/screens/incidents_screen.dart';
import 'package:residente_app/presentation/incidents/widgets/create_incident.dart';
import 'package:residente_app/presentation/incidents/widgets/info_incident.dart';
import 'package:residente_app/presentation/payments/charges/screens/charges_screen.dart';
import 'package:residente_app/presentation/payments/charges/screens/create_charges_screen.dart';
import 'package:residente_app/presentation/payments/charges/widgets/info_charge.dart';
import 'package:residente_app/presentation/payments/residents_payments/screens/info_payment_screen.dart';
import 'package:residente_app/presentation/payments/residents_payments/screens/residents_payments_screen.dart';
import 'package:residente_app/presentation/profile/screens/profile_screen.dart';
import 'package:residente_app/presentation/quiz/screens/quiz_screen.dart';
import 'package:residente_app/presentation/quiz/widgets/create_quiz.dart';
import 'package:residente_app/presentation/quiz/widgets/info_quiz.dart';
import 'package:residente_app/presentation/releases/screens/releases_screen.dart';
import 'package:residente_app/presentation/releases/widgets/create_release.dart';
import 'package:residente_app/presentation/releases/widgets/info_release.dart';
import 'package:residente_app/presentation/reservations/screens/reservation_screen.dart';
import 'package:residente_app/presentation/reservations/widgets/create_reservation.dart';
import 'package:residente_app/presentation/reservations/widgets/info_reservation.dart';
import 'package:residente_app/presentation/resident/dashboard/screens/resident_dashboard.dart';
import 'package:residente_app/presentation/resident/menu/screen/resident_menu_screen.dart';
import 'package:residente_app/presentation/resident/panic_alert/screens/panic_alert_screen.dart';
import 'package:residente_app/presentation/resident/payments/widgets/info_payment_body.dart';
import 'package:residente_app/presentation/resident/payments/widgets/info_pending_payment.dart';
import 'package:residente_app/presentation/resident/payments/widgets/pending_payment.dart';
import 'package:residente_app/presentation/resident/payments/screens/payments_screen.dart';
import 'package:residente_app/presentation/resident/payments/widgets/create_payment.dart';
import 'package:residente_app/presentation/resident/vehicles/screens/vehicles_screen.dart';
import 'package:residente_app/presentation/resident/vehicles/widgets/create_vehicle.dart';
import 'package:residente_app/presentation/resident/vehicles/widgets/info_vehicle.dart';
import 'package:residente_app/presentation/users/screens/create_user_screen.dart';
import 'package:residente_app/presentation/users/screens/users_screen.dart';
import 'package:residente_app/presentation/visits/screens/visits_screen.dart';
import 'package:residente_app/presentation/visits/widgets/binnacle_visits.dart';
import 'package:residente_app/presentation/visits/widgets/create_eventual_visit.dart';
import 'package:residente_app/presentation/visits/widgets/create_frequent_visit.dart';
import 'package:residente_app/presentation/visits/widgets/info_eventual_visit.dart';
import 'package:residente_app/presentation/visits/widgets/info_frequent_visit.dart';
import 'package:residente_app/presentation/wallet/account_status/screens/account_status_screen.dart';
import 'package:residente_app/presentation/wallet/expenses/screens/expenses_screen.dart';
import 'package:residente_app/presentation/wallet/expenses/widgets/create_expense.dart';
import 'package:residente_app/presentation/wallet/expenses/widgets/info_expense.dart';
import 'package:residente_app/presentation/wallet/incomes/screens/incomes_screen.dart';
import 'package:residente_app/presentation/wallet/incomes/widgets/create_income.dart';
import 'package:residente_app/presentation/wallet/incomes/widgets/info_income.dart';
import 'package:residente_app/presentation/wallet/screens/wallet_screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    "auth_login": (_) => const LoginScreen(),
    "auth_forgot_password": (_) => const ForgotPasswordScreen(),
    "admin_home": (_) => const AdminHomeScreen(),
    "users": (_) => const UsersScreen(),
    "create_users": (_) => const CreateUserScreen(),
    "payments_charges": (_) => const ChargesScreen(),
    "payments_info_charge": (_) => const InfoCharge(),
    "payments_create_charges": (_) => const CreateChargesScreen(),
    "payments_resident_info": (_) => const InfoPaymentsScreen(),
    "payments_resident_payment": (_) => const ResidentsPaymentsScreen(),
    "incidents": (_) => const IncidentsScreen(),
    "info_incidents": (_) => const InfoIncidet(),
    "create_incident": (_) => const CreateIncident(),
    "quiz": (_) => const QuizScreen(),
    "info_quiz": (_) => const InfoQuiz(),
    "create_quiz": (_) => const CreateQuiz(),
    "releases": (_) => const ReleasesScreen(),
    "info_release": (_) => const InfoRelease(),
    "create_release": (_) => const CreateRelease(),
    "reservations": (_) => const ReservationScreen(),
    "info_reservation": (_) => const InfoReservation(),
    "create_reservation": (_) => const CreateReservation(),
    "wallet": (_) => const WalletScreen(),
    "expenses": (_) => const ExpensesScreen(),
    "info_expense": (_) => const InfoExpense(),
    "create_expense": (_) => const CreateExpense(),
    "incomes": (_) => const IncomesScreen(),
    "info_income": (_) => const InfoIncome(),
    "create_income": (_) => const CreateIncome(),
    "account_status": (_) => const AccountStatusScreen(),
    "visits": (_) => const VisitsScreen(),
    "info_frequent_visit": (_) => const InfoFrequentVisit(),
    "info_eventual_visit": (_) => InfoEventualVisit(),
    "create_eventual_visit": (_) => const CreateEventualVisit(),
    "create_frequent_visit": (_) => const CreateFrequentVisit(),
    "binnacle_visits": (_) => const BinaccleVisits(),
    "resident_payment_dashboard": (_) => const ResidentDashboard(),
    "resident_menu": (_) => const ResidentMenuScreen(),
    "payments": (_) => const PaymentsScreen(),
    "info_payments_resident": (_) => const InfoResidentPaymentBody(),
    "pending_payment": (_) => const PendingPayment(),
    "info_pending_payment": (_) => const InfoPendingPayment(),
    "create_payment": (_) => const CreatePayment(),
    "vehicles": (_) => const VehiclesScreen(),
    "create_vehicle": (_) => const CreateVehicle(),
    "info_vehicle": (_) => const InfoVehicle(),
    "panic_alert": (_) => const PanicAlert(),
    "profile": (_) => const ProfileScreen(),
    "guard_menu": (_) => const GuardMenuScreen(),
    "part_visits": (_) => const PartVisits(),
    "qr_scan": (_) => QRScan()
  };
}
