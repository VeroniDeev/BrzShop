<script lang="ts">
	export let category: string;
	import topLeftArrow from '$lib/assets/images/icon/topLeftArrow.svg';
	import bottomRightArrow from '$lib/assets/images/icon/bottomRightArrow.svg';
	import Product from './Product.svelte';
	import imageTest from '$lib/assets/images/logo/brzshop-logo.png';
	import { Icon, ChevronRight, ChevronLeft } from 'svelte-hero-icons';
	import carrousel from '$lib/animation/carrousel';

	interface productList {
		name: string;
		type: string;
		star: number;
		peopleStar: number;
		price: number;
		image: string;
	}

	let allProduct: productList[] = [];
	for (let i = 0; i < 12; i++) {
		allProduct.push({
			name: 'iPhone 14 Pro Max',
			star: 4.65,
			peopleStar: 8,
			type: 'iPhone',
			price: 1449.99,
			image: imageTest
		});
	}
</script>

<section class="cat-{category} mx-9 my-12 w-auto h-1/2vh">
	<div class="category-title w-auto relative inline-block overflow-hidden mb-6">
		<img src={topLeftArrow} alt="top left arrow" class="absolute top-0 left-0" />
		<h3 class="font-semibold text-xl w-auto inline px-2 py-1">{category}</h3>
		<img src={bottomRightArrow} alt="bottom right arrow" class="absolute bottom-0 right-0" />
	</div>
	<div class="flex justify-end mb-10">
		<div
			class="nav-right-category mr-9 cursor-pointer select-none"
			on:click={(e) => carrousel.leftPart(`product-catalogue-${category}`)}
		>
			<Icon src={ChevronLeft} size="32" />
		</div>
		<div
			class="nav-left-category cursor-pointer select-none"
			on:click={(e) => carrousel.rightPart(allProduct.length, `product-catalogue-${category}`)}
		>
			<Icon src={ChevronRight} size="32" />
		</div>
	</div>
	<div
		class="product-catalogue-{category} flex flex-nowrap absolute overflow-y-auto select-none ml-10 transition-transform duration-500"
	>
		{#each allProduct as product}
			<a
				href="/product/{category}/{product.type}/{product.name}"
				class="mr-10 w-96"
				draggable="false"
			>
				<Product
					name={product.name}
					star={product.star}
					peopleStar={product.peopleStar}
					type={product.type}
					price={product.price}
					image={product.image}
				/>
			</a>
		{/each}
	</div>
</section>
