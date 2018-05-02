import PropTypes from 'prop-types';
import React from 'react';

export class DealersList extends React.Component {
  static propTypes = {
    dealers: PropTypes.array.isRequired,
    onDealerClick: PropTypes.func.isRequired,
    highlightedDealerId: PropTypes.number
  };

  handleDealerClick = (dealerId, event) => this.props.onDealerClick(dealerId)

  render() {
    const { dealers, onDealerClick, highlightedDealerId } = this.props
    return (
      <div>
        <h3>Dealers</h3>
        <ul>
          {dealers.map((dealer, index) =>
            <li key={`dealerList${index}`} onClick={this.handleDealerClick.bind(this, dealer.id)}>{dealer.name}</li>
          )}
        </ul>
      </div>
    );
  }
}

export default DealersList
