import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["submit"]
  static values = { price: Number }

  connect() {
    this.price_multiplier = 0;
    const dateElement = document.querySelector("#booking_start_date");
    console.log();
    const today = new Date();
    const dateString = `${today.getFullYear()}-${this.#zeroPad(today.getMonth()+1, 10)}-${this.#zeroPad(today.getDay(), 10)}`
    dateElement.value = dateString;
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

  #zeroPad(nr,base){
    var  len = (String(base).length - String(nr).length)+1;
    return len > 0? new Array(len).join('0')+nr : nr;
  }
}
