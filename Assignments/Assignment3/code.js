// // db.books.mapReduce(
//     function() {this.the_book }
//     function() { }
//     // {
//     // query:{  "publishing_year": {$ne 2000}}
//     // ,out: "count_words"
//     // }

//     // )

//////////////////////////////////////////////////////////////////////

mapper = function () {
  let words = this.the_book.split(" ");

  for (let i = 0; i < words.length; i++) {
    var key = words[i].length;
    emit(key, 1);
  }
};

reducer = function (key, count) {
  return Array.sum(count);
};

db.books.mapReduce(mapper, reducer, {
  query: { publishing_year: { $ne: 2000 } },
  out: "count_words",
});

function myotherfun(key, value) {
  return Array.sum(value);
}
myfunc();
myotherfun(myfunc());
// console.log(myfunc);
