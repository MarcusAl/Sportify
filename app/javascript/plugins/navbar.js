const initUpdateNavbarOnScroll = () => {
    const navbar = document.querySelector('nav');
    if (navbar) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight * 0.11) {
          navbar.classList.add('navbar3');
        } else {
          navbar.classList.remove('navbar3');
        }
      });
    }
  }
  
  export { initUpdateNavbarOnScroll };