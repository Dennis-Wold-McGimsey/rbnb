import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// import mapboxgl from 'mapbox-gl'; // or "const mapboxgl = require('mapbox-gl');"

// mapboxgl.accessToken = 'pk.eyJ1IjoiY3B0bGVnbyIsImEiOiJjbGliZ2dsYnAwOWYzM2x1a2I0Z2Z5NWpnIn0.4YgTAzEQhNrHoAIyxPftUg';
// const map = new mapboxgl.Map({
// container: 'map', // container ID
// style: 'mapbox://styles/mapbox/streets-v12', // style URL
// center: [-74.5, 40], // starting position [lng, lat]
// zoom: 9, // starting zoom
// });
