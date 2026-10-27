/**
 * MegaMart - Products & Homepage Deals JavaScript (products.js)
 */

document.addEventListener('DOMContentLoaded', function () {
    initFlashDealCountdown();
    initProductTabsFilter();
    initQuantitySelectors();
});

// Flash Deals Live Countdown Timer
function initFlashDealCountdown() {
    const hoursEl = document.getElementById('dealHours');
    const minsEl = document.getElementById('dealMinutes');
    const secsEl = document.getElementById('dealSeconds');

    if (!hoursEl || !minsEl || !secsEl) return;

    // Set end time 14 hours from current time for continuous lively demo
    let targetTime = new Date().getTime() + (14 * 60 * 60 * 1000) + (35 * 60 * 1000) + (18 * 1000);

    function updateTimer() {
        const now = new Date().getTime();
        const difference = targetTime - now;

        if (difference <= 0) {
            targetTime = new Date().getTime() + (24 * 60 * 60 * 1000);
            return;
        }

        const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((difference % (1000 * 60)) / 1000);

        hoursEl.textContent = hours < 10 ? '0' + hours : hours;
        minsEl.textContent = minutes < 10 ? '0' + minutes : minutes;
        secsEl.textContent = seconds < 10 ? '0' + seconds : seconds;
    }

    updateTimer();
    setInterval(updateTimer, 1000);
}

// Category Tabs Filter on Homepage
function initProductTabsFilter() {
    const tabButtons = document.querySelectorAll('.filter-tab-btn');
    if (!tabButtons.length) return;

    tabButtons.forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            tabButtons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const filterValue = this.getAttribute('data-filter');
            const productItems = document.querySelectorAll('.showcase-product-item');

            productItems.forEach(item => {
                if (filterValue === 'all' || item.getAttribute('data-category') === filterValue) {
                    item.style.display = 'block';
                    item.classList.add('fade-in');
                } else {
                    item.style.display = 'none';
                }
            });
        });
    });
}

// Quantity selector (+/-)
function initQuantitySelectors() {
    document.addEventListener('click', function (e) {
        if (e.target.matches('.qty-plus') || e.target.closest('.qty-plus')) {
            const input = e.target.closest('.quantity-control').querySelector('.quantity-input');
            if (input) input.value = parseInt(input.value || 1) + 1;
        } else if (e.target.matches('.qty-minus') || e.target.closest('.qty-minus')) {
            const input = e.target.closest('.quantity-control').querySelector('.quantity-input');
            if (input && parseInt(input.value) > 1) input.value = parseInt(input.value) - 1;
        }
    });
}
