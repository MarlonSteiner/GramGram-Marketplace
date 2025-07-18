import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["category", "checkin", "checkout", "price"]

  connect() {
    console.log("Search controller connected!")
  }

  search(event) {
    event.preventDefault()
    console.log("Search button clicked!")

    // Get search criteria
    const searchCriteria = {
      category: this.categoryTarget.value,
      checkin: this.checkinTarget.value,
      checkout: this.checkoutTarget.value,
      maxPrice: this.priceTarget.value
    }

    console.log("Search criteria:", searchCriteria)

    // Find the carousel controller and apply filters
    const carouselController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="granny-carousel"]'),
      'granny-carousel'
    )

    if (carouselController) {
      carouselController.applySearchFilters(searchCriteria)
    } else {
      console.error("Carousel controller not found!")
    }
  }

  // Optional: Filter as user types/changes selections
  filterResults() {
    console.log("Filter changed, updating results...")
    this.search(new Event('change'))
  }
}
