process.stdin.on('data', function (chunk) {
    var line = chunk.toString();
		console.log(line.split('').filter(function(val, index, array) {
			return (index % 2 === 0) ? true : false;
		}).join(''));
});
