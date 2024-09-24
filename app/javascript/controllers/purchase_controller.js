import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["wallet", "modal"]
  static values = {
    courseName: String,
    coursePrice: String,
    courseDescription: String,
    preferenceId: String
  }

  async connect() {
  }

  submit() {
    this.walletTarget.querySelector("button").click()
  }

  enable() {
    console.log(this.modalTarget)
    this.modalTarget.classList.remove("hidden")
  }

  disable() {
    this.modalTarget.classList.add("hidden")
  }

  buy(event) {
    const mp = new MercadoPago('APP_USR-5898eb74-47b0-4cda-ae7f-86dbb5010d9b');

    mp.bricks().create("wallet", "wallet_container", {
      initialization: {
        preferenceId: event.currentTarget.dataset.purchasePreferenceId,
      },
      customization: {
        texts: {
          valueProp: 'smart_option',
        },
      },
    })

    this.enable()
  }
}
