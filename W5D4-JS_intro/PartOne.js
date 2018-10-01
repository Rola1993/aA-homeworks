// Phase I - JS Fundamentals

// Mystery Scoping with var, let, const

function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block
// in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}
// in block
// out of block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

//Uncaught SyntaxError: Identifier 'x' has already been declared

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

//in block
//out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// Uncaught SyntaxError: Identifier 'x' has already been declared

// Write a function that takes three strings - a verb, an adjective, and a noun
// - uppercases and interpolates them into the sentence "We shall VERB the
// ADJECTIVE NOUN". Use ES6 template literals.

function madLib(verb, adj, noun) {
  verb = verb.toUpperCase();
  adj = adj.toUpperCase();
  noun = noun.toUpperCase();
  let str = `We shall ${verb} the ${adj} ${noun}`
  console.log(str);
}

//Output: A Boolean. true if the subString is a part of the searchString.

function isSubstring(searchString, subString) {
  let res = searchString.includes(subString);
  return res;
}

// Phase II - JS Looping Constructs


function fizzBuzz(array) {
  let arr = [];
  for (let i = 0; i < array.length; i++) {
    if (((array[i] % 3 ===0) || (array[i] % 5 ===0)) && (array[i] % 15 !== 0)) {
      arr.push(array[i]);
    }
  }
  return arr;
}


function isPrime(number) {
  if (number === 1 || number === 2) {
    return true;
  }
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}


function sumOfNPrimes(n) {

}
