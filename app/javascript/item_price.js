function item_price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${Math.floor(inputValue * 0.1)}`;

    const taxValue = `${Math.floor(inputValue * 0.1)}`;
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = `${inputValue - taxValue}`;

  });
}

window.addEventListener('load', item_price);