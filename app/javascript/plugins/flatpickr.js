import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr(".datepicker", {})

flatpickr(".datepicker", {
  altInput: true
})

$('.datepicker').flatpickr({ minDate: new Date() });

