/**
 * 1. 배송 대기 버튼 클릭시 배송중으로 변함, 버튼 색상 변경
 */
 console.log('adiminDelivery js')

 // 변수
 // 배송 버튼
 let deliveryBeforeBtn = document.querySelectorAll('.js_delivery_btn_b'); 

 // 1. 배송 대기 버튼 클릭시 배송중으로 변함, 버튼 색상 변경
 deliveryBeforeBtn.forEach(function(e,index){
 
 	deliveryBeforeBtn[index].addEventListener('click',function(){
 	
 		console.log(`${deliveryBeforeBtn[index]} 번 버튼 누름`)
 		
 		deliveryBeforeBtn[index].textContent = '배송중'
 		deliveryBeforeBtn[index].classList.add('c_delivery_ing')
 	})
 })
