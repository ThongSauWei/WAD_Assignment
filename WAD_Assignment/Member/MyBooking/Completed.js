const submit = document.getElementById('submit');
const popUpContainer = document.getElementById('popUpContainer');
const close = document.getElementById('close');

submit.addEventListener('click', () => {
    popUpContainer.classList.add('show');
});

close.addEventListener('click', () => {
    popUpContainer.classList.remove('show');
});