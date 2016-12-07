var ReactNative  = require('react-native');
var React = require('react');

var {
  View,
  Text,
  StyleSheet,
  TextInput
} = ReactNative;

var Button = require('../common/button')

module.exports = React.createClass({
  getInitialState : function ()  {
    return {
      username : '',
      password : '' ,
      errorMessage : ''
    };
  },

  render : function() {
    return (
      <View style = {styles.container}>
      <Text>Sign In</Text>
      <Text style = {styles.label}>UserName:</Text>
      <TextInput style = {styles.input}
      value = {this.state.username}
        onChangeText = {(text) => this.setState({username : text})}
      />

      <Text style= {styles.label}>Passwd:</Text>
      <TextInput secureTextEntry = {true} style = {styles.input}
      value = {this.state.password}
      onChangeText = {(text) => this.setState({password : text})}
      />
      <Text style = {styles.label}> {this.state.errorMessage}</Text>

      <Button text= {'Sign In'} onPress = {this.onPress}/>
      <Button text= {'I need an account'} onPress = {this.onSignupPress}/>
     </View>
   );

 },

 onPress : function () {
   //Log the user in
var user = 'ninja';
var pass = '1234';
if(this.state.username == user && this.state.password == pass)
{
  this.setState({
    errorMessage : 'Logged in successfully'
  });
  //this.props.navigator.immediatelyResetRouteStack([{name : 'tweets'}]);
}
else
{
  this.setState({
    errorMessage : 'Wrong Credentials'
  });
}

 },
 onSignupPress : function() {
   //navigate over to signup , push navigator here
   this.props.navigator.push({name : 'signup'})
 }


});

var styles = StyleSheet.create({
    container : {
      flex : 1,
      justifyContent : 'center' ,
      alignItems : 'center'
    },

  input :{
    padding : 4 ,
    height : 40 ,
    borderColor  : 'gray' ,
    borderWidth : 1,
    borderRadius : 5,
    margin : 5,
    width : 200 ,
    alignSelf  : 'center'
  },
  label : {
    fontSize : 17
  }
})
