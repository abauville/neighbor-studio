import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submit"]
  static values = { price: Number }

  connect() {
    console.log("bookingform_controller connected!");
    this.price_multiplier = 0;
  }
  updatePrice(event) {
    if (event.currentTarget.checked) {
      this.price_multiplier += 1;
    } else {
      this.price_multiplier -= 1;
    }

    console.log(this.price_multiplier)
    this.submitTarget.value = `¥${this.price_multiplier * this.priceValue}`
  }
}
