import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/felix-2423/ckpgyfsj907vi17mkifvh98xy'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '50px';
    element.style.height = '50px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    // mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    // map.once('load', () => {
    //   map.resize();
    // })
    // document.querySelector('.mapboxgl-canvas').style.width = '100%';
    // document.querySelector('.mapboxgl-canvas').style.height = '100%';
  }
};

export { initMapbox };
