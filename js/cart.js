/**
 * MegaMart - Cart & Wishlist Interaction JavaScript (cart.js)
 */

window.MegaMart = window.MegaMart || {};

document.addEventListener('DOMContentLoaded', function () {
    initWishlistButtons();
    initAddToCartButtons();
    updateHeaderCounters();
});

// Cart and Wishlist client-state counters (for frontend demonstration)
let cartCount = parseInt(localStorage.getItem('mm_cart_count')) || 3;
let wishlistCount = parseInt(localStorage.getItem('mm_wishlist_count')) || 2;

function updateHeaderCounters() {
    const cartBadges = document.querySelectorAll('.cart-badge-count');
    cartBadges.forEach(b => b.textContent = cartCount);

    const wishlistBadges = document.querySelectorAll('.wishlist-badge-count');
    wishlistBadges.forEach(b => b.textContent = wishlistCount);
}

// Wishlist toggle interaction
function initWishlistButtons() {
    document.addEventListener('click', function (e) {
        const btn = e.target.closest('.btn-wishlist');
        if (!btn) return;

        e.preventDefault();
        e.stopPropagation();

        const productCard = btn.closest('.product-card');
        const productName = productCard ? productCard.querySelector('.product-title')?.textContent.trim() : 'Product';

        btn.classList.toggle('active');
        const icon = btn.querySelector('i');

        if (btn.classList.contains('active')) {
            if (icon) {
                icon.classList.remove('bi-heart');
                icon.classList.add('bi-heart-fill');
            }
            wishlistCount++;
            MegaMart.showToast(`<strong>${productName}</strong> added to your Wishlist!`, 'success', 'Wishlist');
        } else {
            if (icon) {
                icon.classList.remove('bi-heart-fill');
                icon.classList.add('bi-heart');
            }
            wishlistCount = Math.max(0, wishlistCount - 1);
            MegaMart.showToast(`<strong>${productName}</strong> removed from your Wishlist.`, 'info', 'Wishlist');
        }

        localStorage.setItem('mm_wishlist_count', wishlistCount);
        updateHeaderCounters();
    });
}

// Add to Cart interaction
function initAddToCartButtons() {
    document.addEventListener('click', function (e) {
        const btn = e.target.closest('.btn-add-cart');
        if (!btn) return;

        e.preventDefault();

        const productCard = btn.closest('.product-card');
        const productName = productCard ? productCard.querySelector('.product-title')?.textContent.trim() : 'Item';
        const productPrice = productCard ? productCard.querySelector('.price-current')?.textContent.trim() : '';

        const originalHtml = btn.innerHTML;
        btn.disabled = true;
        btn.innerHTML = `<span class="spinner-border spinner-border-sm me-1" role="status"></span> Adding...`;

        setTimeout(() => {
            btn.innerHTML = `<i class="bi bi-check2 me-1"></i> Added!`;
            btn.classList.remove('btn-add-cart');
            btn.classList.add('btn-success');

            cartCount++;
            localStorage.setItem('mm_cart_count', cartCount);
            updateHeaderCounters();

            MegaMart.showToast(`<strong>${productName}</strong> (${productPrice}) added to your cart!`, 'success', 'Cart Updated');

            setTimeout(() => {
                btn.innerHTML = originalHtml;
                btn.classList.remove('btn-success');
                btn.classList.add('btn-add-cart');
                btn.disabled = false;
            }, 1800);
        }, 500);
    });
}
