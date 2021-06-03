import flatpickr from "flatpickr";
import confirmDatePlugin from 'flatpickr/dist/plugins/confirmDate/confirmDate';
import 'flatpickr/dist/flatpickr.css';

const initFlatpickr = () => {
  flatpickr(".datepicker", {
      "enableTime": true,
      "plugins": [new confirmDatePlugin({ })],
    confirmIcon: "<i class='fa fa-check'></i>", // your icon's html, if you wish to override
    confirmText: "OK ",
    showAlways: false,
    theme: "light"
  });
}

export { initFlatpickr };