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