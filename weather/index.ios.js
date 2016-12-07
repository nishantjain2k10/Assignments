/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

 var React = require('react');
 var ReactNative = require('react-native');
 var {
   MapView,
   View,
   Text,
   AppRegistry,
   StyleSheet

 } = ReactNative ;

var Api = require('./src/api');
var Weather = React.createClass({

getInitialState : function () {
  return {
    pin : {
      latitude : 0 ,
      longitude : 0
    },
    city : '',
    temperature : '',
    description : ''
  };
},
   render : function() {
    //  var pins = [{
    //    latitude : 37 ,
    //    longitude : -95
    //  }];

     return <View style = {styles.container}>
      <MapView style = {styles.map} onRegionChangeComplete = {this.onRegionChangeComplete} annotations= {[this.state.pin]}>
       </MapView>
            <View style = {styles.textWrapper}>
            <Text style= {styles.text}>{this.state.city}</Text>
            <Text style= {styles.text}>{this.state.temperature}</Text>
            <Text style= {styles.text}>{this.state.description}</Text>
            </View>

       </View>

   },

   onRegionChangeComplete : function(region) {
     console.log(region);
     this.setState({
       pin : {
         longitude : region.longitude ,
         latitude : region.latitude
       }
     });
     Api(region.latitude,region.longitude)
      .then((data) => {
          console.log(data);

          this.setState(data);
      })
      .catch((error) =>{
        console.log("api call error");
        alert(error.message);
      });
   }

 });

 var styles = StyleSheet.create({
   container:{
     flex : 1 ,
     justifyContent : 'center',
     alignItems : 'stretch' ,
     backgroundColor : '#F5FCFF'
   },
   map : {
     flex : 2,
     marginTop : 30
   },
   textWrapper :{
     flex : 1 ,
     alignItems : 'center'
   },
   text :{
     fontSize : 30
   }

 });

 AppRegistry.registerComponent('weather' , () => Weather);
