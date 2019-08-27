const priceCalc = () => {
  const startDate = document.querySelector(".startdate").value;
  const endDate = document.querySelector(".enddate").value

  const startDateParse = Date.parse(startDate);
  const endDateParse = Date.parse(endDate);
  const parseResult = endDateParse - startDate;

  const min = Math.floor(parseResult/60000);
  const hr = Math.round(min/60);
  const days = Math.round(hr/24);

  const price = +document.getElementById("price").innerText

  const totalCost = document.getElementById("totalcost")
  const math = price * days
  totalCost.innerText = math

}

export default priceCalc;
