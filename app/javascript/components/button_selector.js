// button_selector.js
const initButtonSelector = () => {  $(document).ready(function(){
    $(".category-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
}

export { initButtonSelector };
