import PropTypes from 'prop-types'
import React from 'react'
import classNames from 'classnames'

export class DealersList extends React.Component {
  static propTypes = {
    dealers: PropTypes.array.isRequired,
    onDealerClick: PropTypes.func.isRequired,
    highlightedDealerId: PropTypes.number
  };

  handleDealerClick = (dealerId, event) => this.props.onDealerClick(dealerId)

  render() {
    const { dealers, highlightedDealerId } = this.props
    return (
      <div>
        <ul className='list-group'>
          {dealers.map((dealer, index) => <li
              key={`dealerList${index}`}
              onClick={this.handleDealerClick.bind(this, dealer.id)}
              className={classNames('list-group-item', {'active': dealer.id == highlightedDealerId})}>
              {dealer.name}
            </li>
          )}
        </ul>
      </div>
    );
  }
}

export default DealersList
