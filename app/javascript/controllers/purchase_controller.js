import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["wallet", "modal", "real", "original", "description", "hours", "title", "restriction"]
  static values = {
    courseName: String,
    coursePrice: String,
    courseDescription: String,
    preferenceId: String,
    OriginalPrice: String,
    RealPrice: String,
    Description: String,
    Hours: String,
    Restriction: String,
    Title: String
  }

  connect() {
  }

  submit() {
    this.walletTarget.querySelector("button").click()
  }

  enable() {
    this.modalTarget.classList.remove("hidden")
  }

  disable() {
    this.modalTarget.classList.add("hidden")
  }

  buy(event) {
    this.enable()

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

    this.realTarget.innerText = `${event.currentTarget.dataset.purchaseRealPrice} USD/mes`
    this.originalTarget.innerText = `${event.currentTarget.dataset.purchaseOriginalPrice} USD/mes`
    this.descriptionTarget.innerText = event.currentTarget.dataset.purchaseCourseDescription
    this.hoursTarget.innerText = `${event.currentTarget.dataset.purchaseHours} horas`
    this.restrictionTarget.innerText = event.currentTarget.dataset.purchaseRestriction
    this.titleTarget.innerText = event.currentTarget.dataset.purchaseCourseName
  }
}
