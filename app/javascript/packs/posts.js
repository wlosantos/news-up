const token = document.querySelector("meta[name='csrf-token']").content;
const headers = { "Content-Type": "application/json", "X-CSRF-Token": token };

document.addEventListener('DOMContentLoaded', () => {

  document.querySelectorAll('.action .btn_comment_published').forEach(button => {
    button.addEventListener('click', updade_comment);
  });
});

// if(btn_comment_published() != null) btn_comment_published().addEventListener('click', updade_comment)

const btn_comment_published = () => {
  const btn = document.querySelector('.btn_comment_published');
  return btn;
}

const updade_comment = event => {
  event.preventDefault();
  const actionElement = event.target.closest('.action')
  const dados = JSON.parse(actionElement.dataset.postComment)
  const linhaPost = document.querySelector(`.cmtPost-${dados.id}`)

  const url = `/comments/${dados.id}`
  const options = {
    method: 'PATCH',
    headers,
    body: JSON.stringify({ comment: dados })
  }

  connection(url, options)
  linhaPost.style.display = 'none'
}

const connection = (url, options) => {
  fetch(url, options)
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(errors => console.log(`ERROR(s) ${errors}`))
}
