var http = require("http");
var readline = require('readline');
var opn = require('opn');

var r = readline.createInterface({
  input:process.stdin,
  output:process.stdout
});

var Jsonix = require('jsonix').Jsonix;
var XLink_1_0 = require('w3c-schemas').XLink_1_0;
var GML_3_2_1 = require('ogc-schemas').GML_3_2_1;
var IndoorGML_Core_1_0 = require('ogc-schemas').IndoorGML_Core_1_0;
var IndoorGML_Navigation_1_0 = require('ogc-schemas').IndoorGML_Navigation_1_0;

var mappings = [XLink_1_0, GML_3_2_1, IndoorGML_Core_1_0, IndoorGML_Navigation_1_0];

var context = new Jsonix.Context(mappings, {
  namespacePrefixes : {
    'http://www.w3.org/1999/xlink' : 'xlink',
    'http://www.opengis.net/gml/3.2' : 'gml',
    'http://www.opengis.net/indoorgml/1.0/core' : '',
    'http://www.opengis.net/indoorgml/1.0/navigation' : 'ns4'
  }
});

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
