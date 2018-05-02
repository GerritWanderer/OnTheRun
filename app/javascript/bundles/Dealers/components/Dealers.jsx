import PropTypes from 'prop-types';
import React from 'react';
import DealersList from "./List"
import DealersMap from "./Map"

export class Dealers extends React.Component {
  static propTypes = {
    dealers: PropTypes.array.isRequired
  };

  constructor(props) {
    super(props);
    this.state = { highlightedDealerId: null }
  }

  handleDealerClick = (dealerId) => {
    this.setState({highlightedDealerId: dealerId})
  }

  render() {
    const { dealers } = this.props
    const { highlightedDealerId } = this.state
    const dealerProps = { dealers, highlightedDealerId,
      onDealerClick: this.handleDealerClick.bind(this)
    }

    return (
      <div>
        <DealersList {...dealerProps} />
        <DealersMap {...dealerProps} />
      </div>
    );
  }
}

export default Dealers
