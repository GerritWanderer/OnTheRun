import PropTypes from 'prop-types'
import React from 'react'
import DealersList from './List'
import DealersMap from './Map'
import DealersClusterMap from './ClusterMap'

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
      <div className='dealersContainer'>
        <div className='dealersMap'>
          <DealersClusterMap
            googleMapURL="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_5kOuj--dAHdcjJv3GLPOqnhkGPzMuTM&v=3.exp&libraries=geometry,drawing,places"
            loadingElement={<div style={{ height: `100%` }} />}
            containerElement={<div style={{ height: `400px` }} />}
            mapElement={<div style={{ height: `100%` }} />}
            {...dealerProps}
          />
        </div>
        <div className='dealersList'>
          <DealersList {...dealerProps} />
        </div>
      </div>
    );
  }
}

export default Dealers
