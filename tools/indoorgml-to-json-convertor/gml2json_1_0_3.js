var http = require("http");
var readline = require('readline');
var opn = require('opn');

var r = readline.createInterface({
  input:process.stdin,
  output:process.stdout
});

var IndoorGML_Core_1_0_3 = require('./IndoorGML_Core_1_0_3.js').IndoorGML_Core_1_0_3;
var Jsonix = require('jsonix').Jsonix;
var context = new Jsonix.Context([IndoorGML_Core_1_0_3]);
var unmarshaller = context.createUnmarshaller();

r.question("file name : ", function(filename){
  var resume = unmarshaller.unmarshalFile("./" + filename + ".gml", function(result) {
    var fs = require('fs');
    var writer = fs.createWriteStream("./" + filename + ".json");
    writer.write(JSON.stringify(result, null, 1));

    console.log('Succeed to convert gml to json.');
    console.log('Check', filename+'.json file in this folder.');
    console.log();
    
  });
  r.close();

});
