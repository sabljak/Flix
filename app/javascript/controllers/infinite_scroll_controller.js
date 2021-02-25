import {Controller} from 'stimulus'

export default class extends Controller {

    static targets = ['entries', 'pagination'];

    async initialize() {
        this.intersectionObserver = new IntersectionObserver(entries => this.processEntries(entries))
    }

    async processEntries(entries) {
        for (const entry of entries) {
            if (entry.isIntersecting) {
                await this.loadMore();
                this.intersectionObserver.unobserve(entry.target);
                if (entry.target !== this.entriesTarget.lastElementChild)
                    this.intersectionObserver.observe(this.entriesTarget.lastElementChild)
            }
        }
    }

    connect() {
        this.intersectionObserver.observe(this.entriesTarget.lastElementChild)
    }

    disconnect() {
        this.intersectionObserver.unobserve(this.entriesTarget.lastElementChild)
    }

    async loadMore() {
        const next_page = this.paginationTarget.querySelector("a[rel='next']");
        if (next_page) {
            const res = await fetch(next_page.href, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json'
                }
            });
            const json = await res.json();

            this.entriesTarget.insertAdjacentHTML('beforeend', json.entries);
            this.paginationTarget.innerHTML = json.pagination;
        }

    }
}