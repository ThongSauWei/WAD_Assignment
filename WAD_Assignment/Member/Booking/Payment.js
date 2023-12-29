function selectCard(value) {
    var tng = document.getElementById("tngImage");
    var card = document.getElementById("cardImage");
    var btnTng = document.getElementById("btnTng");
    var btnCard = document.getElementById("btnCard");

    if (value === "tng") {
        tng.classList.remove('deselected');
        card.classList.add('deselected');

        btnTng.classList.add('selected');
        btnCard.classList.remove('selected');
    } else if (value === "card") {
        card.classList.remove('deselected');
        tng.classList.add('deselected');

        btnCard.classList.add('selected');
        btnTng.classList.remove('selected');
    }

    displayPaymentMethod(value);
    updateHiddenField(value);
}

function displayPaymentMethod(value) {
    var tng = document.getElementById("tngPayment");
    var card = document.getElementById("cardPayment");

    if (value === "tng") {
        tng.style.display = "block";
        card.style.display = "none";

        removeRequiredAttribute("cardPayment");
        addRequiredAttribute("tngPayment");
    } else if (value === "card") {
        card.style.display = "block";
        tng.style.display = "none";

        removeRequiredAttribute("tngPayment");
        addRequiredAttribute("cardPayment");
    }
}

function removeRequiredAttribute(divId) {
    var hiddenDiv = document.getElementById(divId);

    if (hiddenDiv) {
        var allInputs = hiddenDiv.querySelectorAll('input[required]');

        allInputs.forEach(function (input) {
            input.removeAttribute('required');
        });
    }
}

function addRequiredAttribute(divId) {
    var shownDiv = document.getElementById(divId);

    if (shownDiv) {
        var allInputs = shownDiv.querySelectorAll('input');

        allInputs.forEach(function (input) {
            input.setAttribute('required', 'true');
        });
    }
}

function updateHiddenField(value) {
    var hiddenField = document.getElementById('ContentPlaceHolder1_paymentChoiceField');

    hiddenField.value = value;
}

function validateForm() {
    var errorMsg = document.getElementById('ContentPlaceHolder1_errorMsg').innerText;
    var hiddenField = document.getElementById('ContentPlaceHolder1_paymentChoiceField');

    if (hiddenField.value == "tng") {
        return true;
    } else {
        if (errorMsg.trim().length > 0) {
            alert('Please correct all the errors before submission.');
            return false;
        }
    }

    return true;
}

document.getElementById('ContentPlaceHolder1_txtCardNo').addEventListener('input', function (event) {
    let inputValue = event.target.value.replace(/[^\d]/g, ''); // Remove non-numeric characters
    let formattedValue = formatCardNumber(inputValue);
    event.target.value = formattedValue;
});

function formatCardNumber(value) {
    // Add a space or dash every 4 digits
    return value.replace(/(\d{4})/g, '$1 ').trim();
}

function handlePinInput(currentInput, nextInputId) {
    var inputValue = currentInput.value;

    currentInput.value = inputValue.replace("[^0-9]", '');

    if (inputValue !== '') {
        if (nextInputId) {
            document.getElementById(nextInputId).focus();
        }
    }
}

function handlePinKeyDown(currentInput, previousInputId) {
    var inputValue = currentInput.value;
    var isBackspace = event.key === 'Backspace' || event.keyCode === 8;

    // If backspace is pressed and the input is empty, move focus to the previous input
    if (isBackspace && inputValue === '') {
        if (previousInputId) {
            document.getElementById(previousInputId).focus();
        }
    }
}

function handlePinFocus(currentInput) {
    var currentInputIndex = parseInt(currentInput.id.charAt(currentInput.id.length - 1));

    if (currentInput.value === '') {
        var firstEmptyInputId = findFirstEmptyInput(currentInputIndex);

        if (firstEmptyInputId) {
            document.getElementById(firstEmptyInputId).focus();
        }
    } else {
        var nextEmptyInputId = findNextEmptyInput(currentInputIndex);

        if (nextEmptyInputId) {
            document.getElementById(nextEmptyInputId).focus();
        }
    }

}

function findFirstEmptyInput(currentIndex) {
    for (var i = currentIndex; i >= 1; i--) {
        var inputId = 'ContentPlaceHolder1_txtPin' + i;
        var prevInputId = 'ContentPlaceHolder1_txtPin' + (i - 1);
        var prevInput = document.getElementById(prevInputId);

        if (!prevInput || prevInput.value !== '') {
            return inputId;
        }
    }

    return 1;
}

function findNextEmptyInput(currentIndex) {

    for (var i = currentIndex; i <= 6; i++) {
        var inputId = 'ContentPlaceHolder1_txtPin' + i;
        var input = document.getElementById(inputId);
        if (input && input.value === '') {
            return inputId;
        }
    }
    return 6;
}

function isNumericKey(event) {
    var charCode = (event.which) ? event.which : event.keyCode;
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
}