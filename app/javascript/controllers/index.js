// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import GrannyCarouselController from "./granny_carousel_controller"
import CategoryFilterController from "./category_filter_controller"
import GrannyFilterController from "./granny_filter_controller"

application.register("granny-carousel", GrannyCarouselController)
application.register("category-filter", CategoryFilterController)
application.register("granny-filter", GrannyFilterController)
