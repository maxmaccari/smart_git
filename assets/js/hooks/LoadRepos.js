const LoadRepos = {
  mounted() {
    const selector = `#${this.el.id}`;
    this.observer = new IntersectionObserver(entries => {
      const [entry] = entries;

      if (entry.isIntersecting) {
        this.pushEventTo(selector, "load_repos", {})
      }
    })
    this.observer.observe(this.el)
  }
}

export default LoadRepos;