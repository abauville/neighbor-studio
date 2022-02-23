import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import * as turf from '@turf/turf'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11"
    })
    this.addMarkersToMap()
    this.fitMapToMarkers()
    this.getUserLocation()
  }

  addMarkersToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.markersValue.lng, this.markersValue.lat ])
      .addTo(this.map)
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markersValue.lng, this.markersValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  getUserLocation() {
    const success = (position) => {
      this.getDistanceFromStudio(position.coords)
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

  getDistanceFromStudio(userLocation) {
    var user = turf.point([userLocation.longitude, userLocation.latitude]);
    var toStudio = turf.point([ this.markersValue.lng, this.markersValue.lat ]);
    var distance = turf.distance(user, toStudio);
    this.displayDistance(distance.toFixed(2))
  }

  displayDistance(distance) {
    const el =  document.getElementById("user-distance")
    el.innerHTML = `<span class="text-lg text-white">Distance: </span> ${distance} km`
  }
}
