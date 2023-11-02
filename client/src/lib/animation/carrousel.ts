let bouton = 0;
// const elPerPage = Math.round(((4 / 8) * 100) / 5) * 5;

const rightPart = (elPerPage: number, id: string) => {
	const divEl: HTMLDivElement | null = document.querySelector('.' + id);
	const calcElPerPage = Math.round(((4 / elPerPage) * 100) / 5) * 5;
	if (divEl && bouton !== calcElPerPage - 100) {
		bouton -= 5;
		divEl.style.transform = 'translateX(' + bouton + '%)';
		console.log(bouton);
		console.log('------------------- ' + (calcElPerPage - 100));
	}
};

const leftPart = (id: string) => {
	const divEl: HTMLDivElement | null = document.querySelector('.' + id);
	if (divEl && bouton !== 0) {
		bouton += 5;
		divEl.style.transform = 'translateX(' + bouton + '%)';
		console.log(bouton);
	}
};

export default { rightPart, leftPart };
