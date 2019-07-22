import React from 'react';
import ReactDOM from 'react-dom';
import ComponentTemplate from './ComponentTemplate';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<ComponentTemplate />, div);
  ReactDOM.unmountComponentAtNode(div);
});
