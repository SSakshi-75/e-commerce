/**
 * MegaMart - Core Application JavaScript (main.js)
 */

window.MegaMart = window.MegaMart || {};

document.addEventListener('DOMContentLoaded', function () {
    initHeaderScroll();
    initBackToTop();
    initSearchInteractions();
});

// Sticky Header elevation on scroll
function initHeaderScroll() {
    const header = document.querySelector('.main-header');
    if (!header) return;

    window.addEventListener('scroll', function () {
        if (window.scrollY > 40) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
}

// Back to Top button
function initBackToTop() {
    const btn = document.getElementById('backToTopBtn');
    if (!btn) return;

    window.addEventListener('scroll', function () {
        if (window.scrollY > 300) {
            btn.classList.add('active');
        } else {
            btn.classList.remove('active');
        }
    });

    btn.addEventListener('click', function (e) {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// Search bar interaction
function initSearchInteractions() {
    const searchForm = document.getElementById('headerSearchForm');
    const searchInput = document.getElementById('txtHeaderSearch');
    const categorySelect = document.getElementById('ddlHeaderCategory');

    if (searchForm && searchInput) {
        searchForm.addEventListener('submit', function (e) {
            const query = searchInput.value.trim();
            if (!query && (!categorySelect || categorySelect.value === '0')) {
                e.preventDefault();
                MegaMart.showToast('Please enter a search keyword or choose a category.', 'warning', 'Search Alert');
            }
        });
    }
}

// Global Toast Notification Helper
MegaMart.showToast = function (message, type = 'success', title = 'MegaMart') {
    let container = document.getElementById('mmToastContainer');
    if (!container) {
        container = document.createElement('div');
        container.id = 'mmToastContainer';
        container.className = 'toast-container position-fixed bottom-0 end-0 p-3';
        container.style.zIndex = '1090';
        document.body.appendChild(container);
    }

    const toastId = 'toast_' + Date.now();
    let iconClass = 'bi-check-circle-fill text-success';
    if (type === 'warning') iconClass = 'bi-exclamation-triangle-fill text-warning';
    if (type === 'danger') iconClass = 'bi-x-circle-fill text-danger';
    if (type === 'info') iconClass = 'bi-info-circle-fill text-primary';

    const toastHtml = `
        <div id="${toastId}" class="toast mm-toast ${type} show" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <i class="bi ${iconClass} me-2 fs-5"></i>
                <strong class="me-auto">${title}</strong>
                <small class="text-muted">Just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                ${message}
            </div>
        </div>
    `;

    container.insertAdjacentHTML('beforeend', toastHtml);
    const toastEl = document.getElementById(toastId);

    setTimeout(() => {
        if (toastEl) {
            toastEl.classList.remove('show');
            setTimeout(() => toastEl.remove(), 300);
        }
    }, 4000);
};
