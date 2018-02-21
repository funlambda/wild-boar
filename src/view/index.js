import * as React from 'react';
const debugView = require('../../../uilibrary-view/src/debugView');
const dynamic = require('../../../uilibrary-view/src/dynamic/index');

const viewSet = {
  'Textbox.Model': (m, view, props) =>
    props.textarea
      ? <textarea style={props.style} value={m.Value}
                  placeholder={props.placeholder}
                  onChange={ce => m.OnChange(ce.target.value)}
                  onFocus={m.OnFocus} onBlur={m.OnBlur} />
      : <input type={props.password ? 'password' : 'text'}
               placeholder={props.placeholder}
               style={{...props.style, borderColor: props.invalid ? '#e82110' : ''}}
               value={m.Value}
               onChange={ce => m.OnChange(ce.target.value)}
               onFocus={m.OnFocus} onBlur={m.OnBlur} />,
  'PathChart.Model': (m, view, props) =>
    require('./pathChart')(m),
  'Slider.Model': (m, view, props) =>
    <input type="range" min={0} max={1} step={0.01} value={m.Position}
        onChange={(x,y) => {m.OnStart(); m.OnMove(x.target.value); m.OnStop();} } />
};

module.exports = dynamic.mkView({viewSet: viewSet, backupView: debugView});
