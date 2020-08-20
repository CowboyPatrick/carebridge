// button_selector.js
const initButtonSelector = () => {  $(document).ready(function(){
    $(".category-choice").click(function(){
      $(this).toggleClass("active");
      $('.create-btn').prop("disabled", false);
    });
  });
}

export { initButtonSelector };
