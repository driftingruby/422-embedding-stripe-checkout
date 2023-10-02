import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stripe"
export default class extends Controller {
  static values = { publicKey: String, clientSecret: String }
  stripe = Stripe(this.publicKeyValue, { betas: ["embedded_checkout_beta_1"] })

  async connect() {
    this.checkout = await this.stripe.initEmbeddedCheckout({
      clientSecret: this.clientSecretValue
    })
    this.checkout.mount(this.element)
  }

  disconnect() {
    this.checkout.destroy()
  }
}
