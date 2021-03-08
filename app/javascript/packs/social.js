const token = document.querySelector("meta[name='csrf-token']").content;
const headers = { "Content-Type": "application/json", "X-CSRF-Token": token };

document.addEventListener('DOMContentLoaded', () => {

  if(btnAdicionar() != null) btnAdicionar().addEventListener('click', solicitar)
  document.querySelectorAll('.action .btn_social').forEach(button => {
  button.addEventListener('click', updated_friend);
});

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

const updated_friend = event => {
  event.preventDefault();
  const actionElement = event.target.closest('.action')
  const dados = JSON.parse(actionElement.dataset.socialId)
  const linhaPost = document.querySelector(`.social-${dados.id}`)

  const url = `/friends/${dados.id}`
  const options = {
    method: 'PATCH',
    headers,
    body: JSON.stringify({ friend: dados })
  }

  connection(url, options)
  linhaPost.style.display = 'none'
}

const connection = (url, options)=>{
  fetch(url, options)
  .then(response => response.ok)
  .then(data => console.log(data))
  .catch(errors => console.log(`ERROR(s) ${errors}`))
}
