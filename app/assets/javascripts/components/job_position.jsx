const JobPositionsDashboard = props => {
  let positionsContainer = '';
  if(props.positions.length !== 0) {
    let positionRows = props.positions.map(position => {
      return positionRowElement(position);
    });

    positionsContainer = (
      <table>
        <thead>
          <tr>
            <th>Company</th>
            <th>Position</th>
            <th>Interest Level</th>
          </tr>
        </thead>
        <tbody>
          {positionRows}
        </tbody>
      </table>
    );
  }

  return (
    <div>
      <button>Add Position</button>
      {positionsContainer}
    </div>
  );
}

positionRowElement = position => {
  let company = position.company.website_url === null ? position.company.name : <a href={position.company.website_url} target="_blank">{position.company.name}</a>;
  let positionTitle = position.title + (position.domain === null ? '' : ` (${position.domain})`);
  let positionFragment = position.job_link === null ? positionTitle : <a href={position.job_link} target="_blank">{positionTitle}</a>;
  let interestValue = position.interest_level === null ? 'unset' : parseInt(position.interest_level) + '/5';

  return (
    <tr key={position.id} className="position_row" id={position.id}>
      <td className="position_company">{company}</td>
      <td className="position_title">{positionFragment}</td>
      <td className="interest_level">{interestValue}</td>
    </tr>
  );
}
