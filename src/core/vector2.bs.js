// Generated by BUCKLESCRIPT VERSION 2.2.0, PLEASE EDIT WITH CARE
'use strict';


function add(param, param$1) {
  return /* Vector2 */[
          param[0] + param$1[0],
          param[1] + param$1[1]
        ];
}

function scale(scalar, param) {
  return /* Vector2 */[
          scalar * param[0],
          scalar * param[1]
        ];
}

function norm(param) {
  return Math.sqrt(Math.pow(param[0], 2) + Math.pow(param[1], 2));
}

var $percent$plus = add;

var $percent$star = scale;

function $percent$neg(a, b) {
  return add(a, scale(-1, b));
}

var zero = /* Vector2 */[
  0,
  0
];

exports.zero = zero;
exports.add = add;
exports.scale = scale;
exports.norm = norm;
exports.$percent$plus = $percent$plus;
exports.$percent$star = $percent$star;
exports.$percent$neg = $percent$neg;
/* No side effect */