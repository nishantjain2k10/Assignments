var ReactNative = require('react-native');

var {
  AppRegistry
} = ReactNative;


var Main = require('./src/main');

AppRegistry.registerComponent('authentication' ,() => Main);
