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

function showPasswordRecoveryPopup() {
    var popup = document.getElementById('passwordRecoveryPopup');
    popup.style.display = 'block';

    // Triggering a reflow to enable the transition effect
    popup.offsetHeight;

    popup.style.opacity = 1;

    addRequiredAttribute("passwordRecoveryPopup");
    removeRequiredAttribute("registerForm");
}

function hidePasswordRecoveryPopup() {
    var popup = document.getElementById('passwordRecoveryPopup');
    popup.style.opacity = 0;

    // After the transition, hide the popup
    setTimeout(function () {
        popup.style.display = 'none';
    }, 300); // 300ms matches the transition duration

    addRequiredAttribute("registerForm");
    removeRequiredAttribute("passwordRecoveryPopup");
}