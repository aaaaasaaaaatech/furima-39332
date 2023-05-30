window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    console.log(addTaxDom);
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const proFitDom = document.getElementById("profit");
    console.log(proFitDom);
    proFitDom.innerHTML =inputValue - parseInt(addTaxDom.innerHTML);
  });
});




