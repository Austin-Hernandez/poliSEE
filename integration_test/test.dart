import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poli_s_e_e/flutter_flow/flutter_flow_icon_button.dart';
import 'package:poli_s_e_e/flutter_flow/flutter_flow_widgets.dart';
import 'package:poli_s_e_e/flutter_flow/flutter_flow_theme.dart';
import 'package:poli_s_e_e/index.dart';
import 'package:poli_s_e_e/main.dart';
import 'package:poli_s_e_e/flutter_flow/flutter_flow_util.dart';

import 'package:poli_s_e_e/backend/firebase/firebase_config.dart';
import 'package:poli_s_e_e/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('Unsuccessful Login - Unregistered User',
      (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(const MyApp());
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 9000),
    );
    await tester.tap(find.byKey(const ValueKey('IconButton_8xsr')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 10000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 9000),
    );
    await tester.enterText(find.byKey(const ValueKey('Email-TextField_qg7y')),
        'notAUser@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Password-TextField_3cha')), 'notAPassword');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Login-Button_6b52')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
  });

  testWidgets('US1 Successful Account Creation', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: SignupWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(
        find.byKey(const ValueKey('Email-Signup_xqf3')), 'j_barboza@uri.edu');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(
        find.byKey(const ValueKey('Password-Signup_ohrr')), 'password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(
        find.byKey(const ValueKey('ConfirmPassword-Signup_rnei')), 'password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(const ValueKey('Button_gpln')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(
        find.byKey(const ValueKey('SearchBar-TextField_ewi7')), findsWidgets);
  });

  testWidgets('Unsuccessful Login Invalid Credentials',
      (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: LoginWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(find.byKey(const ValueKey('Email-TextField_qg7y')),
        'faylynn@gmail.com');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.enterText(
        find.byKey(const ValueKey('Password-TextField_3cha')), 'PassWord');
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    await tester.tap(find.byKey(const ValueKey('Login-Button_6b52')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
  });

  testWidgets('Unsuccessful Creation - Account Already Exists',
      (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: SignupWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(const ValueKey('Email-Signup_xqf3')), 'test@example.com');
    await tester.enterText(
        find.byKey(const ValueKey('Password-Signup_ohrr')), 'testpassword');
    await tester.enterText(
        find.byKey(const ValueKey('ConfirmPassword-Signup_rnei')),
        'testpassword');
    await tester.tap(find.byKey(const ValueKey('Button_gpln')));
    await tester.pumpAndSettle();
    expect(
        find.text('Error: The email is already in use by a different account'),
        findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
