var dict = {};
dict['아메리카노'] = 1;
console.log(dict['연유라떼']==null);
console.log(dict);
if(dict['아메리카노']) {
	console.log('OK');
}
var list = new Array();
list[0] = '아메리카노';
list[1] = '카페라떼';
console.log(list);
console.log('"'+list+'"');
console.log(Object.keys(dict).length);
// *1을 하면 Number타입으로 자동형 변환됨
console.log("2500원".split("원")[0]*1);