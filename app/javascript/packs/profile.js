const tabs = document.querySelectorAll('.tabs ul li');
const tab_wrapper = document.querySelectorAll('.tab_wrapper');

document.addEventListener('DOMContentLoaded', ()=>{

  const tabs = document.querySelectorAll('.tabs ul li');
  const tab_wrapper = document.querySelectorAll('.tab_wrapper');

  tabs.forEach((tab, tab_index) =>{

    tab.addEventListener('click', evt => {
      evt.preventDefault();

      tabs.forEach(tab => {
        tab.classList.remove('is-active');
      })

      tab.classList.add('is-active');

      tab_wrapper.forEach((content, content_index) => {
        if(content_index == tab_index){
          content.style.display = 'block'
        }
        else {
          content.style.display = 'none'
        }
      })
    })

  })
})
