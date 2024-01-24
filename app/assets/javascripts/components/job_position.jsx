//works
/*class TestMsg extends React.Component {
  render() {
    console.log("props: ", this.props);
    return (
      <div>working</div>
    );
  }
}*/

// works
/*function TestMsg() {
  console.log('Props:', Object.keys(this));
  return (<div>working</div>);
}*/

// works
const JobPositionsDashboard = props => {
  console.log('Props: ', props);
  let positionsContainer;
  if(props.positions.length == 0) {
    positionsContainer = <h3>No Positions are present with any events. Add one!</h3>
  } else {
    let positionRows = props.positions.map(position => {
      console.log("position: ", position);
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