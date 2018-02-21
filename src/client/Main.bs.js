// Generated by BUCKLESCRIPT VERSION 2.2.0, PLEASE EDIT WITH CARE
'use strict';

var Util = require("../core/Util.bs.js");
var Bound = require("./Bound.bs.js");
var Problem = require("../core/Problem.bs.js");
var PathChart = require("./PathChart.bs.js");
var Pervasives = require("bs-platform/lib/js/pervasives.js");
var Util$UiLibrary = require("ui-library/src/Util.bs.js");
var Block2$UiLibrary = require("ui-library/src/Block2.bs.js");
var Slider$UiLibrary = require("ui-library/src/Slider.bs.js");
var Textbox$UiLibrary = require("ui-library/src/Textbox.bs.js");
var Operators$UiLibrary = require("ui-library/src/Operators.bs.js");

var floatEditor = Block2$UiLibrary.mapValue(Util$UiLibrary.float_of_string_opt, Block2$UiLibrary.mapInit(Pervasives.string_of_float, Textbox$UiLibrary.block));

function floatPicker(min, max) {
  return Block2$UiLibrary.mapValue(Util$UiLibrary.getOption, Bound.mutually(floatEditor, Block2$UiLibrary.mapValue((function (x) {
                        return x;
                      }), Block2$UiLibrary.mapValue((function (x) {
                            return /* Some */[min + x * (max - min)];
                          }), Slider$UiLibrary.block))));
}

function interactivePathChart(pathConfigs, variablesEditor, _) {
  return Bound.secondToFirst(Block2$UiLibrary.mapValue((function (x) {
                    return /* Some */[x];
                  }), PathChart.mkBlock(pathConfigs)), Block2$UiLibrary.mapValue((function (x) {
                    return /* Some */[x];
                  }), variablesEditor));
}

var chart0 = interactivePathChart(/* :: */[
      PathChart.mkPath(/* Color */["#0074d9"], (function (finalT) {
              return Util.trace(/* tuple */[
                          0,
                          finalT
                        ], Problem.farmerPosition);
            })),
      /* [] */0
    ], floatPicker(0, 1), 0.5);

var chart1 = interactivePathChart(/* :: */[
      PathChart.mkPath(/* Color */["red"], (function (finalT) {
              var f = Problem.sameSpeedSolution(0.0001);
              return Util.traceOptional(/* tuple */[
                          0,
                          finalT
                        ], f);
            })),
      /* :: */[
        PathChart.mkPath(/* Color */["#0074d9"], (function (finalT) {
                return Util.trace(/* tuple */[
                            0,
                            finalT
                          ], Problem.farmerPosition);
              })),
        /* [] */0
      ]
    ], floatPicker(0, 1), 0.5);

var chart2 = interactivePathChart(/* :: */[
      PathChart.mkPath(/* Color */["red"], (function (param) {
              return Util.traceOptional(/* tuple */[
                          0,
                          param[1]
                        ], Problem.computeSolutionForBoarSpeed(param[0], 0.0001));
            })),
      /* :: */[
        PathChart.mkPath(/* Color */["#0074d9"], (function (param) {
                return Util.trace(/* tuple */[
                            0,
                            param[1]
                          ], Problem.farmerPosition);
              })),
        /* [] */0
      ]
    ], Operators$UiLibrary.$less$unknown$unknown$great(floatPicker(0, 2), floatPicker(0, 1)), /* tuple */[
      1.0,
      0.5
    ]);

var stepT = 0.0001;

var stepV = 0.001;

exports.floatEditor = floatEditor;
exports.floatPicker = floatPicker;
exports.interactivePathChart = interactivePathChart;
exports.stepT = stepT;
exports.stepV = stepV;
exports.chart0 = chart0;
exports.chart1 = chart1;
exports.chart2 = chart2;
/* floatEditor Not a pure module */
