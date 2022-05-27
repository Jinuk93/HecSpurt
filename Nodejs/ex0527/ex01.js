console.log("hello world");

console.log("JSON 객체 보여주기 : %j", {name: 'dunkey'});

var result = 0;
console.time('elapsedTime');
for(var i =1; i<=100; i++){
  result += i;
}
console.timeEnd('elapsedTime');
console.log('1부터 100까지 합 %d', result);


console.log("파일의 이름 %s", __filename);
console.log("파일의 path %s", __dirname);
var Person = {name: "dunkey", age: 10};
console.dir(Person);
