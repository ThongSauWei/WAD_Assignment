const clockDesigns = ["clock", "clock2", "clock3", "clock4", "clock5"];
const maxLength = clockDesigns.length;
let startIndex = 0;

const clock = document.querySelector(".clock");
clock.style.background = "url('images/clock5.png')";
clock.style.backgroundSize = "cover";

function changeClock() {
    startIndex++;
    if (startIndex === maxLength) {
        startIndex = 0;
    }
    clock.style.background = `url('images/${clockDesigns[startIndex]}.png')`;
    clock.style.backgroundSize = "cover";
}

const deg = 6;
const hour = document.querySelector(".hour");
const minute = document.querySelector(".minute");
const second = document.querySelector(".second");

setInterval(() => {
    let day = new Date();
    let hh = day.getHours() * 30;
    let mm = day.getMinutes() * deg;
    let ss = day.getSeconds() * deg;

    hour.style.transform = `rotateZ(${hh + mm / 12}deg)`;
    minute.style.transform = `rotateZ(${mm}deg)`;
    second.style.transform = `rotateZ(${ss}deg)`;
});

//icon
document.addEventListener('DOMContentLoaded', function () {
    var buttonContainer = document.querySelector('.card1_table_tbody');

    // Check if the container exists
    if (buttonContainer) {
        buttonContainer.addEventListener('mouseover', function (event) {
            // Check if the mouseover event is triggered by a button
            if (event.target.tagName === 'BUTTON') {
                var icon = event.target.closest('tr').querySelector('.positiveIcon');

                // Change the icon to negativeIcon fas fa-times
                if (icon) {
                    icon.classList.remove('positiveIcon');
                    icon.classList.add('negativeIcon');
                    icon.classList.add('fas');
                    icon.classList.add('fa-times');
                    icon.style.color = '#ecd261';
                }
            }
        });

        buttonContainer.addEventListener('mouseout', function (event) {
            // Check if the mouseout event is triggered by a button
            if (event.target.tagName === 'BUTTON') {
                var icon = event.target.closest('tr').querySelector('.negativeIcon');

                // Change the icon back to positiveIcon fas fa-check
                if (icon) {
                    icon.classList.remove('negativeIcon');
                    icon.classList.add('positiveIcon');
                    icon.classList.add('fas');
                    icon.classList.add('fa-check');
                    icon.style.color = '';
                }
            }
        });
    }
});

// here is for trigger the dynamic button
document.addEventListener('DOMContentLoaded', function () {
    // Use event delegation to handle button hover for dynamically added buttons
    document.addEventListener('mouseover', function (event) {
        if (event.target.tagName === 'BUTTON' && event.target.classList.contains('btn-secondary')) {
            var icon = event.target.closest('tr').querySelector('.positiveIcon');

            // Change the icon to negativeIcon fas fa-times
            if (icon) {
                icon.classList.remove('positiveIcon');
                icon.classList.add('negativeIcon');
                icon.classList.add('fas');
                icon.classList.add('fa-times');
                icon.style.color = '#ecd261';
            }
        }
    });

    document.addEventListener('mouseout', function (event) {
        if (event.target.tagName === 'BUTTON' && event.target.classList.contains('btn-secondary')) {
            var icon = event.target.closest('tr').querySelector('.negativeIcon');

            // Change the icon back to positiveIcon fas fa-check
            if (icon) {
                icon.classList.remove('negativeIcon');
                icon.classList.add('positiveIcon');
                icon.classList.add('fas');
                icon.classList.add('fa-check');
                icon.style.color = '';
            }
        }
    });
});

//real time hour and minutes in image title
document.addEventListener('DOMContentLoaded', function () {
    // Your existing code...

    // Update time every second
    setInterval(updateTime, 1000);

    // Function to update the time
    function updateTime() {
        var now = new Date();
        var hours = now.getHours();
        var minutes = now.getMinutes();

        // Pad single-digit minutes with a leading zero
        minutes = (minutes < 10) ? '0' + minutes : minutes;

        // Display the time in the format HH:mm
        var timeString = hours + ':' + minutes;
        document.querySelector('.movie_title span').textContent = timeString;
    }
});

//sidebar
document.addEventListener('DOMContentLoaded', function () {
    // Get all h1 elements inside the sidebar
    var h1Elements = document.querySelectorAll('#sidebar-wrapper ul li a h1');

    // Add hover event listener to the sidebar wrapper
    document.getElementById('sidebar-wrapper').addEventListener('mouseover', function () {
        // Show all h1 elements
        h1Elements.forEach(function (h1) {
            h1.style.display = 'block';
        });
    });

    // Add mouseout event listener to the sidebar wrapper
    document.getElementById('sidebar-wrapper').addEventListener('mouseout', function () {
        // Hide all h1 elements
        h1Elements.forEach(function (h1) {
            h1.style.display = 'none';
        });
    });
});
