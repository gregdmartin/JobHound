import React from 'react';
import ReactDOM from 'react-dom/client';
import { JobPositionsDashboard } from '../job_position';

// THIS DOES NOT SCALE
// This was a quick way to get some data rendering, but it's currently not super great; it passes the data into the component from the server
// as an HTML attribute. The HTML for this looks...not great.
// TODO: rewrite the controller to act as a GET API that can return (paginated!) job position results
const rootElement = document.getElementById('root') as HTMLElement;
const data = JSON.parse(rootElement.getAttribute('data-job-positions') || '{}');
const root = ReactDOM.createRoot(rootElement);

root.render(<JobPositionsDashboard positions={data} />);