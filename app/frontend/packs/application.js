// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../js/bootstrap_js_files.js'  
require("jquery")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
$(document).ready(function() {
    if ($('.pagination').length) {
      $(window).scroll(function() {
        var url = $('.pagination .next_page').attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
          $('.pagination').text("Please Wait...");
          return $.getScript(url);
        }
      });
      return $(window).scroll();
    }
  });