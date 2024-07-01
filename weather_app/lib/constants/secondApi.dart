// ignore_for_file: unnecessary_string_interpolations

/*
1=String get current weather='https://api.weatherapi.com/v1/current.json?key=562b53154bd04649867101743241206&q=egypt';
2=To get 7 day weather for US Zipcode 07112: JSON: 
Stringget 7 day weather='http://api.weatherapi.com/v1/forecast.json?key=562b53154bd04649867101743241206&q=07112&days=7';
3=Search for cities starting with Lond: JSON: http://api.weatherapi.com/v1/search.json?key=562b53154bd04649867101743241206&q=lond
*/
//forcastApi Ali_Loty---------------

String forcastWeather =
    'http://api.weatherapi.com/v1/forecast.json?key=562b53154bd04649867101743241206&q=cairo&days=7&aqi=yes';

String weatherApiKey = '562b53154bd04649867101743241206';
String baseUrl = '  http://api.weatherapi.com/v1';
String path = '/forecast.json';
var days = '7';

//image in Api don't have http: so you need to concatenate http: befor the image bath.

var image = 'http://cdn.weatherapi.com/weather/64x64/night/113.png';
