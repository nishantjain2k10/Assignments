var ReactNative  = require('react-native');
var React = require('react');

var Signin = require('./components/authentication/signin');
var Signup = require('./components/authentication/signup');
var {
  View,
  Text,
  StyleSheet,
  Navigator
} = ReactNative;


var ROUTES = {
  signin : Signin ,
  signup : Signup
};

module.exports = React.createClass({


renderScene : function (route,navigator) {
  var Component = ROUTES[route.name]; //ROUTES['signin'] => Signin
  return <Component route ={route} navigator = {navigator}/> ;
},

  render : function() {
    return (
    //   <View style = {styles.container}>
    //  <Signin/>
     //
    //  </View>

     <Navigator
     style ={styles.container}
     initialRoute = {{name : 'signin'}}
     renderScene= {this.renderScene}
     configureScene = { () => {return Navigator.SceneConfigs.FloatFromRight ;}}
      />
   )

  }
});

var styles = StyleSheet.create({
  container : {
    flex : 1,
    // justifyContent : 'center' ,
    // alignItems : 'center'
  }
})
