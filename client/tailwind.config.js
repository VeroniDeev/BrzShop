/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],
	theme: {
		extend: {
			backgroundColor: {
				'stone-modern': '#F2F2F2'
			},
			textColor: {
				'stone-modern': '#333333'
			},
			boxShadow: {
				'white-box-shadow':
					'0px 153px 84px 0px rgba(178, 178, 178, 0.70) inset, 0px -192px 100px 0px rgba(178, 178, 178, 0.70) inset'
			},
			colors: {
				'orange-star': '#E27D06'
			}
		}
	},
	plugins: []
};
