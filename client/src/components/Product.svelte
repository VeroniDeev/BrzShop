<script lang="ts">
	import { Icon, Star, ShoppingBag } from 'svelte-hero-icons';

	export let name: string;
	export let type: string;
	export let star: number;
	export let peopleStar: number;
	export let price: number;
	export let image: string;
</script>

<div class="product border-black border-2 rounded-lg w-full h-auto py-4">
	<div class="top-part flex flex-col items-center">
		<img src={image} alt="" class="w-2/6" draggable="false" />
		<div class="star-part w-3/12 flex justify-around items-center py-2">
			<span class="font-semibold text-orange-star inline text-base">{star}</span>
			<Icon src={Star} solid size="16" class="text-orange-star" />
			<span class="font-semibold text-orange-star inline text-base">({peopleStar})</span>
		</div>
	</div>
	<div class="bottom-part px-3 py-3">
		<div class="name-part flex flex-col justify-start">
			<span class="text-xs text-zinc-500">{type}</span>
			<h3 class="font-bold text-base">{name}</h3>
		</div>
		<div class="price-part flex justify-between items-center py-3">
			<span class="font-semibold">{price}</span>
			<Icon src={ShoppingBag} size="30" solid class="text-red-600" />
		</div>
	</div>
</div>
