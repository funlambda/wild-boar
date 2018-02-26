import * as React from 'react';
const dynamic = require('../../../uilibrary-view/src/dynamic/index');

const getTag = model => {
  if (model && model.__tag) return model.__tag;
  return "";
};

const debugView = require('../../../uilibrary-view/src/debugView')(getTag);

const viewSet = {
  Textbox: (m, view, { placeholder, style, password, invalid }) =>
    <input type={password ? 'password' : 'text'}
           placeholder={placeholder}
           style={{...style, borderColor: invalid ? '#e82110' : ''}}
           value={m.value}
           onChange={ce => m.onChange(ce.target.value)}
           onFocus={m.onFocus} onBlur={m.OnBlur} />,
  PathChart: (m, view, props) => require('./pathChart')(m),
  Slider: (m, view, props) =>
    <input type="range" min={0} max={1} step={0.01} value={m.position}
        onChange={(x,y) => {m.onStart(); m.onMove(x.target.value); m.onStop();} } />,
  InteractivePathChart: (m, view) =>
    <div style={{display: 'flex', alignItems: 'center', flexWrap: 'wrap',
                 background: '#fcfcfc', padding: 10, border: 'solid 1px #eee'}}>
      <div style={{flex: 1}}>
        {view(m.pathChart)}
      </div>
      <div style={{}}>
        {view(m.controls)}
      </div>
    </div>,
  Controls: (m, view) =>
    <div>{view(m.inner)}</div>,
  FloatPicker: (m, view, {label}) =>
    <div style={{marginBottom: 20}}>
      <div style={{ fontSize: 14 }}>Time (t)</div>
      <div style={{ background: '#f0f0f0', padding: 10, borderRadius: 10 }}>
        <div style={{display: 'flex'}}>
          {view(m.textbox, { style: { width: 60, marginRight: 10, textAlign: 'center' }})}
          <div style={{width: 200, marginTop: -4}}>
            {view(m.slider)}
          </div>
        </div>
      </div>
    </div>
};

module.exports = dynamic.mkView({ viewSet, getTag, backupView: debugView });
