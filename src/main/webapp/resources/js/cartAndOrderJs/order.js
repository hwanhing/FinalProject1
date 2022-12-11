console.log('order.js')

	const pointRate = 0.05
	
	let rowTotal = document.querySelectorAll(".row_total") 				// 수량 * 단가 * (그람/100)
    
	let totalPrice = document.querySelectorAll(".total_price")         	// 상품가격  
    let allTotalPrice = document.querySelectorAll(".all_total_price")  	// 상품가격 + 배송비 - 사용포인트
    let allPoint = document.querySelectorAll(".all_point")             	// 적립포인트
	
	let inputUsePoint = document.querySelector(".input_use_point")  	// 입력한 사용포인트
    let totalUsePoint = document.querySelectorAll(".total_use_point")  	// 사용포인트
    let canUsePoint = document.querySelector(".can_use_point")      	// 사용 가능한 포인트

	 //---------------------------------------------------------------------------------
	window.onload = CalcAllTotal();
    
    // 총 합계 함수
    function CalcAllTotal(){
   	   console.log('CalcAllTotal 실행')
      
       this.nums = []
       this.sum = 0

       // row total nums 배열에 넣기
       for(let i=0; i<rowTotal.length; i++){
           let num = parseInt(rowTotal[i].textContent.replace(',', ''));
           this.nums.push(num)
       }

       // 배열에 들어간 값 저장
       this.nums.forEach(function(item){
           this.sum += parseInt(item)
       })

       finSum = this.sum

       // 총 상품 금액, 적립 포인트 수정
       let sumText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       let point = Math.round(finSum * pointRate)
       let pointText = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   	   
       totalPrice.forEach(function(e,index){
       		totalPrice[index].textContent = sumText
       		allTotalPrice[index].textContent = sumText
       		allPoint[index].textContent = pointText
       })
    }   


	// 슬라이더 -------------------------------------------------------- 
	// 변수
	let slider = document.querySelector('.slider')
	let summaryOrder = document.querySelector('.summary_order')
	let contentFade = document.querySelector('.content_fade')
	let deliverInfo = document.querySelector('.deliver_info')
	let orderPathA = document.querySelectorAll('.order_path_list a')
	 
 	// ---------------------------------------------------------------------------------------------
 	// fade in 
 	function fadeInActive(){
 		deliverInfo.classList.add('fade_active_txt')
	    
	    for(let i=0; i<3; i++){
	    	orderPathA[i].classList.add('fade_active_txt');
	    }
	    
	    contentFade.classList.add('fade_active')
	    
	    document.querySelector('.summary_order').classList.add('fade_active_txt')
		document.querySelector('.all_total_price').classList.add('fade_active_txt')
		document.querySelector('.pay_btn').setAttribute('disabled',true)
		document.querySelector('.detail_btn').setAttribute('disabled',true)
 	}
 	
 	// fade out
 	function fadeOutActive(){
 		deliverInfo.classList.remove('fade_active_txt')
		
		for(let i=0; i<3; i++){
	    	orderPathA[i].classList.remove('fade_active_txt');
	    }
	    
	    contentFade.classList.remove('fade_active')
	    
	    document.querySelector('.summary_order').classList.remove('fade_active_txt')
		document.querySelector('.all_total_price').classList.remove('fade_active_txt')
 	
 		document.querySelector('.pay_btn').removeAttribute('disabled')
 		document.querySelector('.detail_btn').removeAttribute('disabled')
 	}
 	
 	
 	
 	// ---------------------------------------------------------------------------------------------
	
	// 버튼 클릭시 주문 상세보기 화면 나오는 함수
	function showDetail(){
	    fadeInActive()
	    
	    summaryOrder.classList.add('hidden')
	    slider.classList.add('show')
	}
	
	// 버튼 클릭시 주문 상세보기 들어가는 함수
	function hideDetail(){
		fadeOutActive()

	    summaryOrder.classList.remove('hidden')
	    slider.classList.remove('show')
 	}
	
   // -------------- 포인트 사용
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
   
   function exceptUsePoint(usePointNum){
       
       for(let i in totalUsePoint){
       	 totalUsePoint[i].textContent = usePointNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       }
      
   }

   // 총 주문 금액 재설정 함수
   function exceptPointTotal(usePointNum){
      
      let totalPriceNum = parseInt(totalPrice[1].textContent.replace(',',''))
      
      let allTotalNum = (totalPriceNum - usePointNum)
      let allTotal = allTotalNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
      
      for(let i in allTotalPrice){
       	 allTotalPrice[i].textContent = allTotal
       }
   }
   
   // 주소 선택 --------------------------------------------------------------------------------------
   let addr = document.querySelectorAll('.addr_radio')
   
   addr.forEach(function(e,index){
       		
       	addr[index].addEventListener('click',function(){
       		console.log(addr[index])
       		console.log(index)

			// 0: 집, 1: 회사, 2: 외
       		if(index==2){
       			fadeInActive()
       			
       			
       			document.querySelector('.modal_body').classList.remove('display_none')
       		}
       	})
    })
	   
	function closeModal(){
		console.log('종료 버튼 클릭')
		fadeOutActive()
		document.querySelector('.modal_body').classList.add('display_none')
	}
	   
	   