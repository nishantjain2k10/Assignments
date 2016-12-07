/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */



 // import React, { Component } from 'react';
 // import {
 //    Text,
 //    View
 // } from 'react-native';
 //
 // export default class AwesomeProject extends Component {
 //    constructor() {
 //       super()
 //       this.state = {
 //          myText: 'aliquip ex ea commodo consequat.'
 //       }
 //    }
 //    render() {
 //       return (
 //          <View>
 //             <Text>
 //                {this.state.myText}
 //             </Text>
 //          </View>
 //       );
 //    }
 // }



// Import some code we need

var Moment = require('moment')
var React = require('react');
var ReactNative = require(
  'react-native'
) ;// react-native is the library actually
var AppRegistry = ReactNative.AppRegistry;
var Text = ReactNative.Text;
var View = ReactNative.View;
var StyleSheet = ReactNative.StyleSheet;
var DayItem = require('./src/day-item');

var DAYS = ['sunday' , 'monday' , 'tuesday', 'wednesday', 'thursday' , 'friday' , 'saturday'];

//create a react Component
var Weekdays = React.createClass({
  render :function() {
      return  <View style = {styles.container}>
      <Text style = {styles.textStyle}>
       Days of the week :
      </Text>
      <Text>
        {Moment().format('ddd')}
      </Text>
      {this.daysPrint()}
      </View>
    },

//helper function to print all days
    days : function(){

      return DAYS.map(function(dayValue){
        // called 7 times , one for each day of the week
        return <DayItem day = {dayValue} />
      });

      //days is an array of dayItem components , one for each day of the Weekdays

      //days = [<DayItem day='sunday' /> , <DayItem day = 'tuesday' , .....]
    },

    daysPrint : function(){
      var daysItems = [];
      for(var i=0 ; i<7;i++)
      {
        var day = Moment().add(i,'days').format('dddd');
        daysItems.push(
          <DayItem day = {day} daysUntil = {i} />
        )
      }
      return daysItems
    }
});

//style the react components

var styles = StyleSheet.create({

container : {
  flex :1 ,
  justifyContent : 'center', // Moves stuff heigh wise
  alignItems : 'center'     // Moves stuff width wise
},
textStyle : {
  color : 'blue'
}

});


// show the react Component on the screen

AppRegistry.registerComponent('AwesomeProject' , function(){
  return Weekdays
});




// import React, { Component } from 'react';
// import {
//   AppRegistry,
//   StyleSheet,
//   Text,
//   View
// } from 'react-native';
//
// export default class AwesomeProject extends Component {
// constructor(){
//     super()
//     this.state = {
//       myText : "ninja Bro" ,
//       myName : "Nishant Jain"
//     }
// }
// // deleteText()
// // {
// // this.state = {
// //   myText : "Hello" ,
// //   myName  : "Dude"
// // }
//
// deleteText = () => {
//   this.setState({myText : "Hello"})
//   this.setState({myName : "Dude"})
//
// }
//   render() {
//     return (
//       <View style={styles.container}>
//         <Text style={styles.welcome}>
//           Welcome to React Native!
//         </Text>
//         <Text style={styles.instructions}>
//           To get started, edit index.ios.js
//         </Text>
//         <Text style = {styles.welcome} onPress = {this.deleteText} >
//         {this.state.myText} {"\n"}
//         {this.state.myName}
//         </Text>
//
//         <Text style={styles.instructions}>
//           Press Cmd+R to reload,{'\n'}
//           Cmd+D or shake for dev menu maje kro guys
//         </Text>
//       </View>
//     );
//   }
// }
//
// const styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     justifyContent: 'center',
//     alignItems: 'center',
//     backgroundColor: '#F5FCFF',
//   },
//   welcome: {
//     fontSize: 20,
//     textAlign: 'center',
//     margin: 10,
//   },
//   instructions: {
//     textAlign: 'center',
//     color: '#333333',
//     marginBottom: 5,
//   },
//   imageCss : {
//
//   },
// });
//
// AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);
