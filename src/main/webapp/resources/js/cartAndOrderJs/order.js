console.log('order.js')

	// 슬라이더 -------------------------------------------------------- 
	// 변수
	let slider = document.querySelector('.slider')
	let summaryOrder = document.querySelector('.summary_order')
	 
	// 버튼 클릭시 주문 상세보기 화면 나오는 함수
	function showDetail(){
	    slider.classList.add('show')
	}
	
	// 버튼 클릭시 주문 상세보기 들어가는 함수
	function hideDetail(){
	    slider.classList.remove('show')
 	}

	
   // -------------- 주문서 작성시 사용 
	 
   let totalPrice = document.querySelector(".total_price")         // 상품가격
   let inputUsePoint = document.querySelector(".input_use_point")  // 입력한 사용포인트
   let totalUsePoint = document.querySelector(".total_use_point")  // 사용포인트
   let canUsePoint = document.querySelector(".can_use_point")      // 사용 가능한 포인트
	  
   let allTotalPrice = document.querySelector(".all_total_price")  // 상품가격 + 배송비 - 적립포인트
   let allPoint = document.querySelector(".all_point")             // 적립포인트
	   
   // 적립 포인트 사용
   inputUsePoint.addEventListener('keyup',function(){
      
       let inputPoint = parseInt(inputUsePoint.value)
       let canUsePointV = parseInt(canUsePoint.textContent)

       // 적립 포인트가 1000원 미만이면 input 창 막기
       if(canUsePointV<1000){
           inputUsePoint.setAttribute('disabled',true)
           inputUsePoint.value = 0
           inputPoint = 0
           let pointText = document.querySelector(".pointText")
           pointText.classList.add('alertText')
       }

       // 사용가능한 포인트보다 더 큰 포인트를 사용하려 하는 경우
       if(inputPoint>canUsePointV){
           inputUsePoint.value = canUsePointV
           inputPoint = canUsePointV
           canUsePoint.classList.add('alertText')
       }else{
           canUsePoint.classList.remove('alertText')
       }
       
       // input value 값 공란일 경우 사용 포인트 0으로 변경 
       if(inputUsePoint.value == null || inputUsePoint.value == ""){
           inputPoint = 0
       }
       
       exceptUsePoint(inputPoint)
       exceptPointTotal(inputPoint)
   }) 
   
   // 사용 포인트 제외 함수
   function exceptUsePoint(usePointNum){
       totalUsePoint.textContent = usePointNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   }

   // 총 주문 금액 재설정 함수
   function exceptPointTotal(usePointNum){
      let allTotalNum = (totalPrice.textContent - usePointNum)
      let allTotal = (totalPrice.textContent - usePointNum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
      allTotalPrice.textContent = allTotal
   }
	   
