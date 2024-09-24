import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["button", "modal", "buy", "selected", "url", "preferenceId"]
  static values = {
    courseName: String,
    coursePrice: String,
    courseDescription: String
  }

  async connect() {
    const selected = window.location.search.includes("country");
    if (selected) {
      this.popUp()
      this.preparePurchase()
    }
  }

  popUp() {
    this.modalTarget.classList.remove('hidden');
  }

  enable(event) {
    this.popUp()
    const selected = window.location.search.includes("country");
    if (selected) {
      let url = window.location.href.split("&")[0]
      window.location.href = url + `&course=${event.currentTarget.dataset.modalButtonCourseName}`;
    } else {
      window.location.href = window.location.href + `?country=onl&course=${event.currentTarget.dataset.modalButtonCourseName}`;
    }
  }

  disable() {
    this.modalTarget.classList.add('hidden');
  }

  preparePurchase() {
    let country = window.location.search.match(/country=\w{3}/g)[0].split("=")[1];
    let course = window.location.search.match(/course=\w+/g)[0].split("=")[1];

    let preferenceId = "";

    // if (country == "ars") {
    //   APP_USR = "APP_USR-8187849894420733-091811-9c117aab94ddb18c41dc7ea446d5417e-1994986217";
    //   locale = 'es-AR';
    // }
    if (country !== "onl") {
      const preferenceIdPerCountry = { "ars": {}, "clp": {}, "mxn": {}, "pen": {} }
      this.preferenceIdTargets.forEach((element) => {
        preferenceIdPerCountry[element.dataset.country][element.dataset.course] = element.dataset.preferenceId
      });

      preferenceId = preferenceIdPerCountry[country][course]
      console.log(preferenceId)

      const mp = new MercadoPago('APP_USR-5898eb74-47b0-4cda-ae7f-86dbb5010d9b');

      mp.bricks().create("wallet", "wallet_container", {
        initialization: {
          preferenceId: preferenceId,
        },
        customization: {
          texts: {
            valueProp: 'smart_option',
          },
        },
      });
    }
  }

  buy() {
    this.buyTarget.querySelector("button").click();
  }
}
