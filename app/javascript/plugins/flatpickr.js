import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


flatpickr(".datepicker", {})


flatpickr(".range_start", {
  minDate: new Date(),
  altInput: true,
  plugins: [new rangePlugin({ input: ".range_end"})]
})

