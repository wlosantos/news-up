const token = document.querySelector("meta[name='csrf-token']").content;
const headers = { "Content-Type": "application/json", "X-CSRF-Token": token };

document.addEventListener('DOMContentLoaded', () => {

  if(btnAdicionar() != null) btnAdicionar().addEventListener('click', solicitar)

});


const btnAdicionar = () =>{
  const btn = document.querySelector('.btn-adicionar');
  return btn;
}

const btnAcceptFriend = () => {
  const btn = document.querySelector('.btn-accept');
  return btn;
}

const solicitar = event => {
  event.preventDefault();
  const elem = event.target.dataset.socialId;
  const url = '/friends';
  const options = {
    method: 'POST',
    headers,
    body: JSON.stringify({friend: {friend: elem} })
  }

  connection(url, options);
  btnAdicionar().style.display = 'none'
  const btn_parent = document.querySelector('.btn_action .action');
  btn_parent.innerHTML = 'solicitado!!'

}

const acceptFriend = event => {
  console.log('botão acionado')
}

const connection = (url, options)=>{
  fetch(url, options)
  .then(response => response.ok)
  .then(data => console.log(data))
  .catch(errors => console.log(`ERROR(s) ${errors}`))
}
