import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? contains(
  String? key,
  String? stringToSearch,
) {
  if (key == null || stringToSearch == null) return false;

  if (key == "" || key == " ") return false;

  return stringToSearch.toLowerCase().contains(key.toLowerCase());
}

String? elipseString(
  String? input,
  int? length,
) {
  if (input == null || length == null) return "";

  if (input.length < length) return input;

  String output = "";
  for (int i = 0; i < length && i < input.length; i++) {
    output += input[i];
  }

  output += "...";

  return output;
}

String? listToString(List<String>? inputList) {
  // Make the function take in a list of strings and then return a string that concatenates each element of the list into one string with ", " as a delimiter
  if (inputList == null || inputList.isEmpty) return null;
  return inputList.join(', ');
}

bool isValidURL(String? inputText) {
  // Checks to see if the inputted string is formatted like a valid URL to a news article. It must not contain illegal characters. It must start with "http://" or "https://". It must contain a top-level domain (ex. ".com", ".net", ".org", etc.)
  if (inputText == null) return false;

  final urlPattern = r'^(https?:\/\/)?([a-z0-9-]+\.)+[a-z]{2,}';
  final regex = RegExp(urlPattern, caseSensitive: false);

  return regex.hasMatch(inputText);
}
