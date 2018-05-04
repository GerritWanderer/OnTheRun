import PropTypes from 'prop-types'
import React from 'react'
import { withScriptjs, withGoogleMap, GoogleMap, Marker } from "react-google-maps"
import { MarkerClusterer } from "react-google-maps/lib/components/addons/MarkerClusterer"

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
    zoom: 5
  };

  handleDealerClick = (key, props) => this.props.onDealerClick(props.dealerId)

  render() {
    const DefaultMarker = () => <img src={IconMarkerInactive} />
    const HighlightedMarker = () => <img src={IconMarkerActive} />
    const { dealers, highlightedDealerId, center, zoom } = this.props
    return (
      <div className={'dealersMapContainer'}>
        <GoogleMap defaultZoom={this.props.zoom} defaultCenter={this.props.center}>
          <MarkerClusterer averageCenter enableRetinaIcons gridSize={60}>
            {dealers.map((dealer, index) => <Marker
              key={`dealerMap${index}`}
              position={{ lat: parseFloat(dealer.lat), lng: parseFloat(dealer.lon) }}
            />)}
          </MarkerClusterer>
        </GoogleMap>
      </div>
    );
  }
}

export default withScriptjs(withGoogleMap(DealersMap))
