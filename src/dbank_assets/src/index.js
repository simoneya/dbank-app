import { dbank } from "../../declarations/dbank";

//to update balance on Current Balance field everytime dapp gets loaded.
window.addEventListener("load", async function() {
    //console.log("Finish loading.");
    update();
});

document.querySelector("form").addEventListener("submit", async function(event) {
    event.preventDefault();//To prevent form from default refresh everytime you submit.
    //console.log("Submitted.");

    const button = event.target.querySelector("#submit-btn");

    //Get the value from input and output inputs.
    const inputAmount = parseFloat(document.getElementById("input-amount").value); //change default datatype(Int) to Float.
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value); //same.

    button.setAttribute("disabled", true); //once clicked on submit button it will become disable.

    if (document.getElementById("input-amount").value.length != 0) {
        await dbank.topUp(inputAmount);
    }

    if(document.getElementById("withdrawal-amount").value.length != 0) {
        await dbank.withdraw(outputAmount);
    }
 

    await dbank.compound();

    update()

    document.getElementById("input-amount").value = "" ;
    document.getElementById("withdrawal-amount").value = "" ;
    button.removeAttribute("disabled"); //to make button enable again.
});

async function update() {
     //To display value after topup your account.
     const currentAmount = await dbank.checkBalance();
     document.getElementById("value").innerText = Math.round(currentAmount *100) / 100;
};

