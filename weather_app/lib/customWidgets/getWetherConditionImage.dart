// ignore_for_file: prefer_interpolation_to_compose_strings, unused_local_variable

/* 
How to get icon URL..
URL is https://openweathermap.org/img/wn/10d@2x.png 
*/

//------------------------------------------------------this method work with( firstApi  )-------------

String weatherConditionImage = "https://openweathermap.org/img/wn/";

getWeatherImage({String? weatherMain, String? icon}) {
  String weatherImage = weatherConditionImage + '$icon@2x.png';
  switch (weatherMain!.toLowerCase()) {
    case 'thunderstorm':
      return weatherImage;
    case 'drizzle':
      return weatherImage;
    case 'rain':
      return weatherImage;
    case 'snow':
      return weatherImage;
    case 'Clear':
      return weatherImage;
    case 'Clouds':
      return weatherImage;
    default:
      return weatherImage;
  }
}