import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submit", "startTime", "endTime"]
  static values = { price: Number }

  connect() {
    console.log("bookingform_controller connected!");
    this.price_multiplier = 0;
    this.updatePrice();
  }
  updatePrice(event) {
    this.price_multiplier = this.endTimeTarget.value - this.startTimeTarget.value;

    console.log(this.price_multiplier)
    this.submitTarget.value = `¥${this.price_multiplier * this.priceValue}`
  }
  updateEndTimeSelection(event) {
    console.log("updateEndTime!!");
    console.log(event.currentTarget.selectedIndex);
    const startTime = 10 + event.currentTarget.selectedIndex;
    this.endTimeTarget.innerHTML = ""
    for (let i = startTime; i <= 19; i += 1) {
      if (i <= 12) {
        this.endTimeTarget.innerHTML += `<option value="${i}" >${i} AM</option>`
      } else {
        this.endTimeTarget.innerHTML += `<option value="${i}" >${i-12} PM</option>`
      }
    }
    this.endTimeTarget.innerHTML += ""
    if (event.currentTarget.selected) {
      console.log(this.endTimeTarget);
    }
  }
}
