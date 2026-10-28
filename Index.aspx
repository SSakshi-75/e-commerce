<%@ Page Title="ShopX – Big Style. Bigger Savings." Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="All_In_One_Ecommerce.Index" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="css/home.css" rel="stylesheet" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <!-- 1. HERO BANNER SECTION -->
        <section class="hero-banner-section">
            <div class="hero-slider-wrap">
                <!-- Slide 1 -->
                <a href="Products.aspx" class="hero-banner-slide active" id="heroSlide1" style="display: block;"
                    title="Shop Mega Sale - Big Style. Bigger Savings.">
                    <img src="images/banners/hero-banner-1.jpg" alt="Big Style Bigger Savings - Mega Sale"
                        class="hero-banner-img" />
                </a>

                <!-- Slide 2 -->
                <a href="Products.aspx" class="hero-banner-slide" id="heroSlide2" style="display: none;"
                    title="Trending Tech - Bigger Choices">
                    <img src="images/banners/hero-banner-2.jpg" alt="Trending Tech - Bigger Choices"
                        class="hero-banner-img" />
                </a>

                <!-- Slide 3 -->
                <a href="Products.aspx?filter=deals" class="hero-banner-slide" id="heroSlide3" style="display: none;"
                    title="Stylish Picks - Flat 50% Off">
                    <img src="images/banners/hero-banner-3.jpg" alt="Stylish Picks - Flat 50% Off"
                        class="hero-banner-img" />
                </a>

                <!-- Pagination Dots Notch -->
                <div class="hero-dots-notch">
                    <span class="hero-dot active" id="heroDot0"></span>
                    <span class="hero-dot" id="heroDot1"></span>
                    <span class="hero-dot" id="heroDot2"></span>
                </div>
            </div>

            <!-- Instant 2-Second 3-Slide Carousel Script -->
            <script>
                (function () {
                    var s = [
                        document.getElementById('heroSlide1'),
                        document.getElementById('heroSlide2'),
                        document.getElementById('heroSlide3')
                    ];
                    var d = [
                        document.getElementById('heroDot0'),
                        document.getElementById('heroDot1'),
                        document.getElementById('heroDot2')
                    ];
                    var current = 0;

                    function showBanner(idx) {
                        if (idx >= 3) current = 0;
                        else if (idx < 0) current = 2;
                        else current = idx;

                        for (var i = 0; i < 3; i++) {
                            if (s[i]) s[i].style.display = (i === current) ? 'block' : 'none';
                            if (d[i]) d[i].classList.toggle('active', i === current);
                        }
                    }

                    if (d[0]) d[0].onclick = function (e) { e.preventDefault(); showBanner(0); };
                    if (d[1]) d[1].onclick = function (e) { e.preventDefault(); showBanner(1); };
                    if (d[2]) d[2].onclick = function (e) { e.preventDefault(); showBanner(2); };

                    // Auto slide every 2 seconds (2000ms)
                    setInterval(function () {
                        showBanner(current + 1);
                    }, 2000);
                })();
            </script>
        </section>

        <!-- 2. TOP CATEGORIES SECTION -->
        <section class="home-section top-categories-section">
            <div class="header-container">
                <div class="section-heading-wrap d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <span class="section-accent-pill"></span>
                        <h2 class="section-title">Top Categories</h2>
                    </div>
                    <a href="Products.aspx" class="section-view-all">
                        View All <span class="ms-1">&rarr;</span>
                    </a>
                </div>

                <div class="categories-grid">
                    <a href="Products.aspx?cat=fashion" class="category-card" title="Fashion">
                        <div class="category-img-box">
                            <img src="images/categories/fashion.png" alt="Fashion" />
                        </div>
                        <span class="category-title">Fashion</span>
                    </a>
                    <a href="Products.aspx?cat=electronics" class="category-card" title="Electronics">
                        <div class="category-img-box">
                            <img src="images/categories/electronics.png" alt="Electronics" />
                        </div>
                        <span class="category-title">Electronics</span>
                    </a>
                    <a href="Products.aspx?cat=laptops" class="category-card" title="Laptops">
                        <div class="category-img-box">
                            <img src="images/categories/laptops.png" alt="Laptops" />
                        </div>
                        <span class="category-title">Laptops</span>
                    </a>
                    <a href="Products.aspx?cat=footwear" class="category-card" title="Footwear">
                        <div class="category-img-box">
                            <img src="images/categories/footwear.png" alt="Footwear" />
                        </div>
                        <span class="category-title">Footwear</span>
                    </a>
                    <a href="Products.aspx?cat=bags" class="category-card" title="Bags">
                        <div class="category-img-box">
                            <img src="images/categories/bags.png" alt="Bags" />
                        </div>
                        <span class="category-title">Bags</span>
                    </a>
                    <a href="Products.aspx?cat=watches" class="category-card" title="Watches">
                        <div class="category-img-box">
                            <img src="images/categories/watches.png" alt="Watches" />
                        </div>
                        <span class="category-title">Watches</span>
                    </a>
                    <a href="Products.aspx?cat=beauty" class="category-card" title="Beauty">
                        <div class="category-img-box">
                            <img src="images/categories/beauty.png" alt="Beauty" />
                        </div>
                        <span class="category-title">Beauty</span>
                    </a>
                    <a href="Products.aspx?cat=furniture" class="category-card" title="Home & Living">
                        <div class="category-img-box">
                            <img src="images/categories/home-living.png" alt="Home & Living" />
                        </div>
                        <span class="category-title">Home &amp; Living</span>
                    </a>
                </div>
            </div>
        </section>

        <!-- 3. BEST DEALS SECTION -->
        <section class="home-section best-deals-section">
            <div class="header-container">
                <div class="section-heading-wrap d-flex align-items-center">
                    <span class="section-accent-pill"></span>
                    <h2 class="section-title">Best Deals</h2>
                </div>

                <div class="deals-layout-row">
                    <!-- 4 Product Deals Grid (Left) -->
                    <div class="deals-products-grid">
                        <!-- Deal 1: Nike Air Force 1 -->
                        <div class="product-deal-card">
                            <span class="deal-discount-badge">-40%</span>
                            <div class="product-deal-img-box">
                                <img src="images/products/nike-air-force-1.png" alt="Nike Air Force 1" />
                            </div>
                            <div class="product-deal-body">
                                <h3 class="product-deal-title">Nike Air Force 1</h3>
                                <div class="product-deal-price">
                                    <span class="price-strikethrough">&#8377;9,999</span>
                                    <span class="price-active">&#8377;5,999</span>
                                </div>
                                <button type="button" class="btn-deal-cart"
                                    onclick="addToCart(1, 'Nike Air Force 1', 5999, 'images/products/nike-air-force-1.png');">
                                    <i class="bi bi-cart3 me-1"></i> Add to Cart
                                </button>
                            </div>
                        </div>

                        <!-- Deal 2: Boat Rockerz 450 -->
                        <div class="product-deal-card">
                            <span class="deal-discount-badge">-35%</span>
                            <div class="product-deal-img-box">
                                <img src="images/products/boat-rockerz-450.png" alt="Boat Rockerz 450" />
                            </div>
                            <div class="product-deal-body">
                                <h3 class="product-deal-title">Boat Rockerz 450</h3>
                                <div class="product-deal-price">
                                    <span class="price-strikethrough">&#8377;3,999</span>
                                    <span class="price-active">&#8377;2,599</span>
                                </div>
                                <button type="button" class="btn-deal-cart"
                                    onclick="addToCart(2, 'Boat Rockerz 450', 2599, 'images/products/boat-rockerz-450.png');">
                                    <i class="bi bi-cart3 me-1"></i> Add to Cart
                                </button>
                            </div>
                        </div>

                        <!-- Deal 3: Fire-Boltt Smartwatch -->
                        <div class="product-deal-card">
                            <span class="deal-discount-badge">-30%</span>
                            <div class="product-deal-img-box">
                                <img src="images/products/fire-boltt-smartwatch.png" alt="Fire-Boltt Smartwatch" />
                            </div>
                            <div class="product-deal-body">
                                <h3 class="product-deal-title">Fire-Boltt Smartwatch</h3>
                                <div class="product-deal-price">
                                    <span class="price-strikethrough">&#8377;5,999</span>
                                    <span class="price-active">&#8377;4,199</span>
                                </div>
                                <button type="button" class="btn-deal-cart"
                                    onclick="addToCart(3, 'Fire-Boltt Smartwatch', 4199, 'images/products/fire-boltt-smartwatch.png');">
                                    <i class="bi bi-cart3 me-1"></i> Add to Cart
                                </button>
                            </div>
                        </div>

                        <!-- Deal 4: Wildcraft Backpack -->
                        <div class="product-deal-card">
                            <span class="deal-discount-badge">-50%</span>
                            <div class="product-deal-img-box">
                                <img src="images/products/wildcraft-backpack.png" alt="Wildcraft Backpack" />
                            </div>
                            <div class="product-deal-body">
                                <h3 class="product-deal-title">Wildcraft Backpack</h3>
                                <div class="product-deal-price">
                                    <span class="price-strikethrough">&#8377;2,999</span>
                                    <span class="price-active">&#8377;1,499</span>
                                </div>
                                <button type="button" class="btn-deal-cart"
                                    onclick="addToCart(4, 'Wildcraft Backpack', 1499, 'images/products/wildcraft-backpack.png');">
                                    <i class="bi bi-cart3 me-1"></i> Add to Cart
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Limited Time Offer Promo Banner (Right) -->
                    <div class="deal-promo-card">
                        <div class="deal-promo-content">
                            <span class="deal-promo-subtitle">Limited Time Offer</span>
                            <div class="deal-promo-headline">
                                <span class="text-upto">UP TO</span>
                                <span class="text-off"><strong class="highlight-red">50%</strong> OFF</span>
                            </div>
                            <a href="Products.aspx?filter=offers" class="btn-deal-promo">
                                Grab The Deal <span class="ms-1">&rarr;</span>
                            </a>
                        </div>
                        <div class="deal-promo-image-wrap">
                            <img src="images/banners/limited-time-offer.png" alt="Limited Time Offer"
                                class="deal-promo-bg-img" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 4. FEATURED PROMO BANNER SECTION -->
        <section class="home-section promo-featured-banner-section">
            <div class="header-container">
                <div class="featured-promo-banner">
                    <div class="featured-promo-content">
                        <div class="promo-badge-pill">
                            <span class="badge-dot"></span>
                            <span>SEASON SPOTLIGHT &bull; BIG SAVINGS FEST</span>
                        </div>
                        <h2 class="featured-promo-title">
                            Upgrade Your Everyday <br />
                            <span class="highlight-red-text">Tech &amp; Trendsetting Style</span>
                        </h2>
                        <p class="featured-promo-desc">
                            Discover handpicked essentials from leading global brands. Unleash premium audio,
                            cutting-edge smart wearables, and iconic fashion at unmatched prices.
                        </p>

                        <div class="featured-promo-perks">
                            <div class="perk-item">
                                <i class="bi bi-lightning-charge-fill"></i>
                                <span>Express Delivery</span>
                            </div>
                            <div class="perk-item">
                                <i class="bi bi-shield-check"></i>
                                <span>100% Original</span>
                            </div>
                            <div class="perk-item">
                                <i class="bi bi-arrow-repeat"></i>
                                <span>7-Day Easy Returns</span>
                            </div>
                        </div>

                        <div class="featured-promo-actions">
                            <a href="Products.aspx" class="btn-promo-primary">
                                Shop The Collection <span class="ms-1">&rarr;</span>
                            </a>
                            <a href="Products.aspx?filter=deals" class="btn-promo-secondary">
                                Explore All Offers
                            </a>
                        </div>
                    </div>

                    <div class="featured-promo-visual">
                        <div class="promo-circle-glow"></div>
                        <div class="promo-floating-tag tag-discount">
                            <span class="tag-label">SAVE UP TO</span>
                            <span class="tag-val">70% OFF</span>
                        </div>
                        <div class="promo-floating-tag tag-rating">
                            <i class="bi bi-star-fill text-warning"></i>
                            <span class="tag-val">4.9 / 5</span>
                            <span class="tag-label">Top Rated</span>
                        </div>

                        <div class="promo-showcase-grid">
                            <div class="promo-showcase-card card-main">
                                <img src="images/products/nike-air-force-1.png" alt="Nike Air Force 1" />
                                <span class="showcase-card-title">Footwear</span>
                            </div>
                            <div class="promo-showcase-card card-sub1">
                                <img src="images/products/boat-rockerz-450.png" alt="Boat Rockerz 450" />
                                <span class="showcase-card-title">Audio</span>
                            </div>
                            <div class="promo-showcase-card card-sub2">
                                <img src="images/products/fire-boltt-smartwatch.png" alt="Smartwatch" />
                                <span class="showcase-card-title">Wearables</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 5. CURATED SPOTLIGHT & ASSURANCE SECTION -->
        <section class="home-section curated-spotlight-section">
            <div class="header-container">
                <!-- Top Card: Wrapped with love + 6 Curated Cards Strip -->
                <div class="curated-strip-card">
                    <!-- Left: Wrapped with love -->
                    <div class="curated-gift-badge">
                        <div class="curated-gift-icon-wrap">
                            <img src="images/banners/card-img.jpg" alt="Wrapped with love" class="curated-gift-img" />
                        </div>
                        <span class="curated-gift-title">Wrapped with love</span>
                    </div>

                    <div class="curated-divider"></div>

                    <!-- Right: 6 Curated Cards Track -->
                    <div class="curated-cards-track">
                        <a href="Products.aspx?cat=footwear" class="curated-card-item">
                            <div class="curated-card-img-box bg-tint-1">
                                <img src="images/products/nike-air-force-1.png" alt="Trending Hoops" />
                            </div>
                            <span class="curated-card-label">TRENDING HOOPS</span>
                        </a>

                        <a href="Products.aspx?cat=watches" class="curated-card-item">
                            <div class="curated-card-img-box bg-tint-2">
                                <img src="images/products/fire-boltt-smartwatch.png" alt="Thin Bangles" />
                            </div>
                            <span class="curated-card-label">THIN BANGLES</span>
                        </a>

                        <a href="Products.aspx?cat=fashion" class="curated-card-item">
                            <div class="curated-card-img-box bg-tint-3">
                                <img src="images/categories/fashion.png" alt="Festive Styles" />
                            </div>
                            <span class="curated-card-label">FESTIVE STYLES</span>
                        </a>

                        <a href="Products.aspx?cat=electronics" class="curated-card-item">
                            <div class="curated-card-img-box bg-tint-4">
                                <img src="images/products/boat-rockerz-450.png" alt="Cute Studs in 9KT Gold" />
                            </div>
                            <span class="curated-card-label">CUTE STUDS IN 9KT GOLD</span>
                        </a>

                        <a href="Products.aspx?cat=bags" class="curated-card-item">
                            <div class="curated-card-img-box bg-tint-5">
                                <img src="images/products/wildcraft-backpack.png" alt="Affordable Gifts" />
                            </div>
                            <span class="curated-card-label">AFFORDABLE GIFTS</span>
                        </a>

                        <a href="Products.aspx?cat=beauty" class="curated-card-item">
                            <div class="curated-card-img-box bg-tint-6">
                                <img src="images/categories/beauty.png" alt="Nose Pins" />
                            </div>
                            <span class="curated-card-label">NOSE PINS</span>
                        </a>
                    </div>
                </div>

                <!-- Bottom Bar: 4 Trust & Assurance Badges (CaratLane Style) -->
                <div class="trust-assurance-strip">
                    <div class="assurance-item">
                        <div class="assurance-icon-circle circle-blue">
                            <i class="bi bi-patch-check-fill"></i>
                        </div>
                        <span class="assurance-text">100% Certified</span>
                    </div>

                    <div class="assurance-item">
                        <div class="assurance-icon-circle circle-pink">
                            <i class="bi bi-calendar2-check-fill"></i>
                        </div>
                        <span class="assurance-text">15 Day Exchange</span>
                    </div>

                    <div class="assurance-item">
                        <div class="assurance-icon-circle circle-green">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <span class="assurance-text">Lifetime Exchange</span>
                    </div>

                    <div class="assurance-item">
                        <div class="assurance-icon-circle circle-yellow">
                            <i class="bi bi-arrow-repeat"></i>
                        </div>
                        <span class="assurance-text">One Year Warranty</span>
                    </div>
                </div>
            </div>
        </section>
    </asp:Content>