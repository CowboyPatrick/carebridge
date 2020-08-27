import Rails from '@rails/ujs'

const orderSubmit = () => {
  const orderBtn = document.getElementById('next-page-order')
  if (orderBtn) {
    orderBtn.addEventListener('click', (event) => {
      event.preventDefault();
      // const orderForm = document.getElementById('new_order')
      // console.log(orderForm)
      // Rails.fire(orderForm, 'submit')
      const orderFormBtn = document.getElementById('new_form_btn')
      orderFormBtn.click();
    })
  }
}

export { orderSubmit};


