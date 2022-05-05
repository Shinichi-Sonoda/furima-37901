function calc (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
   const addTaxPrice = document.getElementById("add-tax-price") 
   addTaxPrice.innerHTML = Math.floor( itemPrice.value * 0.1 )
   const profit = document.getElementById("profit")
   profit.innerHTML = itemPrice.value - Math.floor( itemPrice.value * 0.1 )

  });


};


window.addEventListener('load', calc);