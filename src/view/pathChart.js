import * as React from 'react';
import { PathLine } from 'react-svg-pathline'

module.exports = m => {
  const paths =
    m.paths.map(x => ({ color: x[0], points: x[1][0].map(a => ({ x: a[0] * 100, y: (1 - a[1]) * 100 })) }))
           .filter(x => x.points.length > 0);

  return (
    <svg viewBox="0 0 100 100" width="300" height="300">
      <g>
        <g>
          <g transform="scale(0.8) translate(10 10)">
            <g>
              <line x1={0} y1={-5} y2={100} x2={0} stroke="grey" strokeWidth={0.2} />
              <line x1={0} y1={100} y2={100} x2={105} stroke="grey" strokeWidth={0.2} />
              <line x1={-2} y1={0} x2={0} y2={0} stroke="grey" strokeWidth={0.2} />
              <text dy={0} y={2} x={-4} style={{ textAnchor: "middle", fontSize: 6, fill: "grey" }}>1</text>
              <line x1={100} y1={98} x2={100} y2={104} stroke="grey" strokeWidth={0.2} />
              <text y={110} x={100} style={{ textAnchor: "middle", fontSize: 6, fill: "grey" }}>1</text>
              <line x1={0} y1={0} x2={100} y2={0} strokeDasharray="2,1" stroke="grey" strokeWidth={0.2} />
              <line x1={100} y1={0} x2={100} y2={100} strokeDasharray="2,1" stroke="grey" strokeWidth={0.2} />
              <circle cx={100} cy={0} r={1.5} fill="grey" />
              <text y={-2} x={107} style={{ textAnchor: "middle", fontSize: 6, fill: "#888" }}>exit</text>
            </g>
            <g>
              {paths.map(p => (
                <PathLine
                   points={p.points}
                   fill="none"
                   stroke={p.color}
                   r={0.01} />
              ))}
            </g>
          </g>
        </g>
      </g>
    </svg>
  );
};
