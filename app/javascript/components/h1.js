import Typed from 'typed.js';
const initTyped = () => {
  new Typed('#typed', {
    strings: ["PAINEL DO PROPRIETARIO_"],
    typeSpeed: 100,
    loop: false,
  });

  new Typed('#typed_player', {
    strings: ["PAINEL DO PLAYER_"],
    typeSpeed: 100,
    loop: false,
  });
}
export { initTyped };
