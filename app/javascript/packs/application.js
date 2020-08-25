// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import Sortable from 'sortablejs';




// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initButtonSelector } from '../components/button_selector';
import { getPosition } from '../components/emergencyBtn';

document.addEventListener('turbolinks:load', () => {
  initButtonSelector();
  getPosition();
  var el = document.getElementById('grocery-items-inactive');
  var el2 = document.getElementById('grocery-items-active');
  if (el) {
    var sortable = new Sortable(el, {
      group: 'grocery-items',
      animation: 100
    });

   var sortable2 = new Sortable(el2, {
    group: 'grocery-items',
    animation: 100
  });
  };
});
