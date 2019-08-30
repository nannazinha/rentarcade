import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
// import { Portuguese } from "flatpickr/dist/l10n/pt.js"


flatpickr(".datepicker", {})


flatpickr(".range_start", {
  // locale: 'pt',
  minDate: new Date(),
  altInput: true,
  plugins: [new rangePlugin({ input: ".range_end"})]
})

