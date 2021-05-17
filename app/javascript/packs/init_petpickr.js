// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
import flatpickr from "flatpickr";

const initPetpickr = () => {

  const dateInput = document.getElementById('playdate-picker');

  // Check that the query selector id matches the one you put around your form.
  if (dateInput) {
    const unavailableDates = JSON.parse(dateInput.dataset.unavailable)

    flatpickr(dateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d",
    });
  }
}

export { initPetpickr };
