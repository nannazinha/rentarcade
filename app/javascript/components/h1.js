import Typed from 'typed.js';
const initTyped = () => {
  new Typed('#typed', {
    strings: ["PAINEL DO PROPRIETARIO_"],
    typeSpeed: 50,
    loop: false,
  });

  new Typed('#typed-transactions-index', {
    strings: ["RESERVAS_"],
    typeSpeed: 50,
    loop: false,
  });
}
export { initTyped };
