const item = () => {
  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ) );
  })
};

window.addEventListener("turbo:load", item);
window.addEventListener("turbo:render", item);