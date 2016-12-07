var rootUrl = 'http://api.openweathermap.org/data/2.5/weather?APPID=31a54099e8182b744ca2a391c7756bff';
//http://stackoverflow.com/questions/37978220/react-native-ios-simulator-network-connection
var firstLetterCapital = require('lodash');
var kelvinToF = function(kelvin){
  return Math.round((kelvin-273.15)*1.8+32) + ' F'
};

module.exports = function (latitude,longitude){
  var url =  `${rootUrl}&lat=${latitude}&lon=${longitude}`;
  return fetch(url)
    .then(function(response){
      return response.json();
    })
    .then(function(json){
      return {
        city : json.name,
        temperature:kelvinToF(json.main.temp),
        description: firstLetterCapital.capitalize(json.weather[0].description)
      }
    })
    .catch(function(error){
      console.log('problem' + error.message);
      throw error;

    });
}
