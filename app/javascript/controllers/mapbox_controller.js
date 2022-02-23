import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import * as turf from '@turf/turf'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/markiec/ckzz5088s000415n2taxrb9q9"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#getUserLocation()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      if (marker.marker_html) {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window)
        // Create HTML element for custom marker

        const customMarker = document.createElement("div");
        customMarker.className = 'marker';
        customMarker.innerHTML = marker.marker_html.trim();

        new mapboxgl.Marker(customMarker)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(this.map)
      } else {
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(this.map)
      }
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #getUserLocation() {
    const success = (position) => {
      this.#getDistanceFromStudio(position.coords)
    }

    const error = () => {
      console.log('no location!')
    }

    if(!navigator.geolocation) {
      console.log('Geolocation is not supported by your browser');
    } else {
      console.log('Locating…');
      navigator.geolocation.getCurrentPosition(success, error);
    }
  }

  #getDistanceFromStudio(userLocation) {
    var user = turf.point([userLocation.longitude, userLocation.latitude]);
    var toStudio = turf.point([ this.markersValue[0].lng, this.markersValue[0].lat ]);
    var distance = turf.distance(user, toStudio);
    this.#displayDistance(distance.toFixed(2))
  }

  #displayDistance(distance) {
    const el =  document.getElementById("user-distance")
    el.innerHTML = `
      <span class="text-lg text-white">
        <i class="fas fa-map-marked-alt me-2"></i>Distance:
      </span>
      ${distance} km
    `
  }
}
