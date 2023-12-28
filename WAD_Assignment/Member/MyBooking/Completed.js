//const submit = document.getElementById('submit');
//const popUpContainer = document.getElementById('popUpContainer');
//const close = document.getElementById('close');

const termCheck = document.getElementById('term');
const submitCheck = document.getElementById('ContentPlaceHolder1_submitRefund');

function ifTermIsChecked(e) {
    if (termCheck.checked) {
        submitCheck.disabled = false;
    } else {
        submitCheck.disabled = true;
    }
}
ifTermIsChecked()

termCheck.addEventListener('change', ifTermIsChecked)

submitCheck.addEventListener('click', () => {
    popUpContainer.classList.add('show');
});

/*submit.addEventListener('click', () => {
    popUpContainer.classList.add('show');
});

close.addEventListener('click', () => {
    popUpContainer.classList.remove('show');
});*/