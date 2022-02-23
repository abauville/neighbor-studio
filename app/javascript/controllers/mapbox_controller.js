import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

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
}
