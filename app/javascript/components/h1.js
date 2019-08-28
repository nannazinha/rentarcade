import Typed from 'typed.js';
const initTyped = () => {
  new Typed('#typed', {
    stringsElement: '#typed-strings',
    typeSpeed: 50,
    loop: false,
  });
}

export { initTyped };
