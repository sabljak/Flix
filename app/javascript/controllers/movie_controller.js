import {Controller} from 'stimulus'

export default class extends Controller {

    static targets = ['entries', 'pagination']

    scroll() {
        const next_page = this.paginationTarget.querySelector("a[rel='next']");
        if (next_page) {
            const url = next_page.href;
            if (window.innerHeight + window.scrollY >= document.body.scrollHeight) {
                this.loadMovies(url);
            }
        }
    }

    async loadMovies(url) {
        const res = await fetch(url, {
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