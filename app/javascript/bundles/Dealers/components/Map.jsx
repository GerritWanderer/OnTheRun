import PropTypes from 'prop-types'
import React from 'react'
import GoogleMapReact from 'google-map-react'
import IconMarkerActive from 'images/icons/maps/marker-active.png'
import IconMarkerInactive from 'images/icons/maps/marker-inactive.png'

export class DealersMap extends React.Component {
  static propTypes = {
    dealers: PropTypes.array.isRequired,
    onDealerClick: PropTypes.func.isRequired,
    highlightedDealerId: PropTypes.number
  };

  static defaultProps = {
    center: {
      lat: 50.23,
      lng: 7.59
    },
    zoom: 6
  };

  handleDealerClick = (key, props) => this.props.onDealerClick(props.dealerId)

  render() {
    const DefaultMarker = () => <img src={IconMarkerInactive} />
    const HighlightedMarker = () => <img src={IconMarkerActive} />
    const { dealers, highlightedDealerId, center, zoom } = this.props
    return (
      <div className={'dealersMapContainer'}>
        <GoogleMapReact
          bootstrapURLKeys={{ key: 'AIzaSyA_5kOuj--dAHdcjJv3GLPOqnhkGPzMuTM' }}
          defaultCenter={this.props.center}
          defaultZoom={this.props.zoom}
          onChildClick={this.handleDealerClick}
        >
          {dealers.map((dealer, index) => {
            const markerProps = {
              key: `dealerMap${index}`,
              dealerId: dealer.id,
              lat: parseFloat(dealer.lat),
              lng: parseFloat(dealer.lon)
            }

            return dealer.id == highlightedDealerId ?
              <HighlightedMarker {...markerProps} /> : <DefaultMarker {...markerProps} />
          })}
        </GoogleMapReact>
      </div>
    );
  }
}

export default DealersMap
