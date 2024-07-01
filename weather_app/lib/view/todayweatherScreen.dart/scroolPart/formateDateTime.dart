import 'package:intl/intl.dart';

getDateTime(var inputDate) {
  // Your input datetime string
  String inputDateString = "$inputDate";

  // Define a formatter for parsing the input datetime string
  // Define a formatter for parsing the input datetime string
  DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm");

  // Parse the input datetime string into a DateTime object
  DateTime inputDateTime = inputFormat.parse(inputDateString);

  // Set the minutes to 0 to convert to "yyyy-MM-dd HH:00"
  DateTime convertedDateTime = DateTime(inputDateTime.year, inputDateTime.month, inputDateTime.day,
                                       inputDateTime.hour);

  // Define a formatter for formatting the converted datetime
  DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm");

  // Format the converted datetime into the desired format
  String formattedDateTime = outputFormat.format(convertedDateTime);

  // Print the formatted datetime
  print(formattedDateTime); // Output: 2024-06-15 17:00

  return formattedDateTime;
}
