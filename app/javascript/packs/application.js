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
import { initMapbox } from './init_mapbox';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // Script to open and close sidebar
  const w3_open = (e) => {
    e.preventDefault();
    document.getElementById("mySidebar").style.display = "block";
  }

  const w3_close = (e) => {
    e.preventDefault();
    document.getElementById("mySidebar").style.display = "none";
  }

  const openNav = document.querySelector('#open-nav');
  const closeNav = document.querySelector('.close-nav');

  if (openNav) {
    openNav.addEventListener('click', w3_open);
  }

  if (closeNav) {
    closeNav.addEventListener('click', w3_close);
  }
});

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})

// const formElement = document.getElementById('searchForm');
// formElement.addEventListener('submit', (event) => {
//   // prevent form's default behavior
//   event.preventDefault();

//   // get input value
//   const address = document.getElementById('address').value;
//   const mapboxKey = 'pk.eyJ1IjoiY2hvcHBlcnBhbmRhIiwiYSI6ImNrbnUwejZnNjA1MmUycHBpYWN6ZDIyNncifQ.P8py9aOI5DBPtfwZBTYcRQ';
//   // trigger request to Google Maps API
//   fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${mapboxKey}`)
//     .then(response => response.json())
//     .then((data) => {
//       const coordinates = {
//         lng: data.features[0].geometry.coordinates[0],
//         lat: data.features[0].geometry.coordinates[1]
//       };
//       injectCoordinates(coordinates);
//       injectMap(coordinates);
//     });
// });

