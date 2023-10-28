<script>
	import logo from '$lib/assets/images/logo/brzshop-logo.png';
	import { Icon, User, ShoppingCart } from 'svelte-hero-icons';
</script>

<header class="header w-full grid grid-cols-3 px-9 py-6">
	<div class="logo-part">
		<a href="/">
			<img src={logo} alt="Logo of BrzShop" class="w-16 h-auto" />
		</a>
	</div>
	<div class="search-part">
		<input type="search" name="" id="" class="outline-none" />
	</div>
	<div class="nav-part flex justify-end items-center">
		<nav class="w-3/6">
			<ul class="flex justify-evenly items-center">
				<li class="text-xl font-bold"><a href="/">Home</a></li>
				<li class="text-xl text-stone-600 font-semibold"><a href="/promo">Promo</a></li>
				<li class="text-xl"><a href="/sign"><Icon src={User} solid size="32" /></a></li>
				<li class="text-xl"><Icon src={ShoppingCart} solid size="32" /></li>
			</ul>
		</nav>
	</div>
</header>
