import * as Redux from 'redux'
import * as React from 'react';
import * as ReactDOM from 'react-dom';
import * as Serialize from 'fable-core/umd/Serialize';
import * as SimpleClient from './out/Core/SimpleClient';

function startClient(rootElem, block, view) {
  const store = {
    Create: reducer => initialState =>
      Redux.createStore((s,a) => {
        if (a.type == "Blah")
          return reducer(s)(a.action);
        else
          return s;
      }, initialState),
    Dispatch: store => action => store.dispatch({ type: 'Blah', action: action }),
    GetState: store => store.getState(),
    Subscribe: store => cb => store.subscribe(cb)
  };

  const runResult =
    SimpleClient.run({
      Block: block,
      Store: store,
      RenderModel: model => {
        //const view = require("./view/index");
        const elem = <div>{view(model)}</div>;
        ReactDOM.render(elem, rootElem);
      }
  });
}

module.exports = (blocks, view) => {
  console.log('Running interactive blocks', blocks);
  Object.keys(blocks).map(k => {
    const elem = document.getElementById('block-' + k);
    if (!elem) {
      console.log("Unable to find placeholder for block " + k);
    } else{
      console.log('Running block ' + k)
      startClient(elem, blocks[k], view);
    }
  });
}
