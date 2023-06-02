import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import { clippingParents } from "@popperjs/core"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {

  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,address"
    })
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.geocoder.addTo(this.element)
  }

  #setInputValue(event) {
    console.log('the shit', event.result["place_name"].replace(/^(.*?),(.*)$/, "$1"));
    const str = event.result["place_name"].replace(/^(.*?),(.*)$/, "$1");
    this.addressTarget.value = event.result["place_name"].replace(/^(.*?),(.*)$/, "$1");
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
