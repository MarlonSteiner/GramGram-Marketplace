import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  applyFilter(event) {
    // Update active state
    this.element.querySelectorAll('.filter-button').forEach(button => {
      button.classList.remove('active')
    })
    event.currentTarget.classList.add('active')

    // Get filter and apply to carousel
    const filter = event.currentTarget.dataset.filter
    const carouselController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="granny-carousel"]'),
      'granny-carousel'
    )

    if (carouselController) {
      carouselController.filterByType(filter)
    }
  }
}
