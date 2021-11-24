import mapboxgl from '!mapbox-gl';
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
    // const bounds = new mapboxgl.LngLatBounds();
    const markers = JSON.parse(mapElement.dataset.markers)
    console.log({markers});
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);
      // debugger
      // bounds.extend(feature.geometry.coordinates);
    });

    fitMapToMarkers(map, markers);
  }
  // add location center - where the user searches (from dataset in html)


};
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 2000 });
  };

export { initMapbox };
