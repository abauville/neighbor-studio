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
      style: "mapbox://styles/markiec/ckzz5088s000415n2taxrb9q9",
      center: [139.7690, 35.6804],
      zoom: 10
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#getUserLocation()
    this.#cardsHoverHighlightsMarkers()
    this.#scrollToCardOnPriceHover()
  }

  #cardsHoverHighlightsMarkers() {
    const cards = document.querySelectorAll(".studio-card");
    const markers = document.querySelectorAll(".marker");
    cards.forEach((card, index) => {
      card.addEventListener("mouseenter", (event) => {
        markers[index].classList.add("highlighted");
      });
      card.addEventListener("mouseleave", (event) => {
        markers[index].classList.remove("highlighted");
      });
    });
  }

  #scrollToCardOnPriceHover() {
    const markers = document.querySelectorAll(".marker");
    markers.forEach((marker) => {
      marker.addEventListener("mouseenter", (event) => {
        const studioId = marker.querySelector('.price-container').dataset.studioId
        const card = document.getElementById(`studio-card-${studioId}`)
        card.scrollIntoView({ behavior: 'smooth', block: 'center' })
        card.querySelector(".studio-info-btn").classList.add('active')
      });
      marker.addEventListener("mouseleave", (event) => {
        const studioId = marker.querySelector('.price-container').dataset.studioId
        const card = document.getElementById(`studio-card-${studioId}`)
        card.querySelector(".studio-info-btn").classList.remove('active')
      });
    })
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
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3000 })
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
