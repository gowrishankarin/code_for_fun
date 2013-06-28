var fs = require('fs');
var $ = require('jquery');

$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if(o[this.name] !== undefined) {
			if(!o[this.name].push) {
				o[this.name] = [o[this.name]];
			} 	
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};


var prime = function(lastNumber) {
	var primesSize = (lastNumber -1)/2;
	var isPrime = [];
	for(var i = 0; i <= primesSize; i++) {
		isPrime[i] = 1;
	}

	for ( var i = 3; i*i <= lastNumber; i+=2) {
		if(isPrime[i >> 1] == 1) {
			for(var j = i*i; j <= lastNumber; j+=2*i) {
				isPrime[j >> 1] = 0;
			}
		}
	}


	
	var found = lastNumber >= 2 ? 1 : 0;
	for(var i = 1; i <= primesSize; i++) {
		found += isPrime[i];
	}

	return found;


}; 



var perfCalc = function() {

	var perfData = [];
	
	
	for(var i=10; i <= 27; i++) {
		
		var startTime = new Date();
		var primeCount = prime(Math.pow(2, i));
		var endTime = new Date();
		var data = new Object();
		
		data.duration = endTime.getTime() - startTime.getTime();
		data.range = Math.pow(2, i);
		data.primeCount = primeCount;
		perfData.push(data);
		console.log(data);
			
	
	} 
	console.log(perfData);
	fs.writeFileSync("perfData.txt", JSON.stringify(perfData));

}


perfCalc();

