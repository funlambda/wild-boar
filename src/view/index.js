import * as React from 'react';
const debugView = require('../../../uilibrary-view/src/debugView');
const dynamic = require('../../../uilibrary-view/src/dynamic/index');

const viewSet = {
  Textbox: (m, view, props) =>
    props.textarea
      ? <textarea style={props.style} value={m.value}
                  placeholder={props.placeholder}
                  onChange={ce => m.onChange(ce.target.value)}
                  onFocus={m.onFocus} onBlur={m.OnBlur} />
      : <input type={props.password ? 'password' : 'text'}
               placeholder={props.placeholder}
               style={{...props.style, borderColor: props.invalid ? '#e82110' : ''}}
               value={m.value}
               onChange={ce => m.onChange(ce.target.value)}
               onFocus={m.onFocus} onBlur={m.OnBlur} />,
  PathChart: (m, view, props) => require('./pathChart')(m),
  Slider: (m, view, props) =>
    <input type="range" min={0} max={1} step={0.01} value={m.position}
        onChange={(x,y) => {m.onStart(); m.onMove(x.target.value); m.onStop();} } />,
  Bound: (m, view) =>
    <div>
      {view(m.left)}
      {view(m.right)}
    </div>  
};

const getTag = model => {
  if (model && model.__tag) return model.__tag;
  return "";
};

module.exports = dynamic.mkView({ viewSet, getTag, backupView: debugView(getTag) });
