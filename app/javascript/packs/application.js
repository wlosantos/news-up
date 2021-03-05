import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "packs/custom"
import 'packs/flashMessages'
import 'packs/user'
require("trix")
require("@rails/actiontext")

Rails.start()
ActiveStorage.start()

import 'bulma/bulma'
import "@fortawesome/fontawesome-free/js/all";
import '../src/application.scss'
