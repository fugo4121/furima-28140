function price() {
  const Prise = document.getElementById("item-price");
  const Tax = document.getElementById("add-tax-price");

  Prise.oninput = function() {
    Tax.innerHTML = Math.ceil(Prise.value * 0.1)
    profit.innerHTML = Prise.value - Tax.innerHTML

  };
}
window.addEventListener("load", price);

