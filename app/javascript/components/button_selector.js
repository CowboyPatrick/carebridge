// button_selector.js
const initButtonSelector = () => {  $(document).ready(function(){
    $(".category-choice").click(function(){
      $(this).toggleClass("active");
      document.querySelector('#next-page-order i').classList.remove('d-none');
      $('.create-btn').prop("disabled", false);
    });
  });
}

export { initButtonSelector };
