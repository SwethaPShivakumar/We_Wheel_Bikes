import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    // fit map to markers
    const bounds = new mapboxgl.LngLatBounds();
    const markers = JSON.parse(mapElement.dataset.markers)
    debugger
    markers.forEach(function (feature) {
      debugger
      bounds.extend(feature.geometry.coordinates);
    });

    map.fitBounds(bounds);
  }
  // add location center - where the user searches (from dataset in html)


};

export { initMapbox };
