console.log('js')
   // 버튼 클릭시 ---------------------------------------------------------------
   
   /*
    numToString >> 변수명.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
    StringToNum >> parseInt(b_price.textContent.replace(/,/g , '')
    replaceAll(",", "")
   */
   
   // 변수 
   // 구매 최대값, 최소값 변수
   const maxOrder = 20
   const minOrder = 1
   const pointRate = 0.05
   let finSum = 0;
 
   // 버튼 변수 
   //let btnUp = document.querySelectorAll(".btn_up")
   let btnDown = document.querySelectorAll(".btn_down")

   // input 변수
   let inputCnt = document.querySelectorAll(".input_cnt") // 수량 
   let rowPrice = document.querySelectorAll(".row_price") // 단가 
   let rowGram = document.querySelectorAll(".row_gram")	  // 그람
   let rowTotal = document.querySelectorAll(".row_total") // 수량 * 단가 * (그람/100)
   
   // 총 합계 변수
   let totalPrice = document.querySelector(".total_price")         // 상품가격
   let allTotalPrice = document.querySelector(".all_total_price")  // 상품가격 + 배송비 - 적립포인트
   let allPoint = document.querySelector(".all_point")             // 적립포인트

   // input hidden 값으로 넘겨줘야할 값
   let rowTotalH = document.querySelectorAll(".row_total_hidden")
   let totalPriceH = document.querySelector(".total_price_hidden")
   let allPointH = document.querySelector(".all_point_hidden")     //

   //---------------------------------------------------------------------------------
   	
   window.onload = onloadCalc();

   // 윈도우 로드시 row total 함수(단가 * 수량 * (그람수/100))
   function onloadCalc(){
	   
	   let heart = document.querySelectorAll('.heart_1')
	   
   		inputCnt.forEach(function(e,index){
   			
   			// 수량 1일경우 버튼 비활성화
   			if(inputCnt[index].value==1){
		           btnDown[index].setAttribute('disabled',true)
		           btnDown[index].classList.add('disabled_btn')
		    }
   			
   			let rowPriceNum = parseInt(rowPrice[index].value) // 단가
   			let rowInCntNum = parseInt(inputCnt[index].value) // 수량
   			let rowGramNum = parseInt(rowGram[index].textContent)/100 // 그람수/100

   			let rowTotalNum = rowPriceNum * rowInCntNum * rowGramNum  
   			rowTotal[index].textContent = rowTotalNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   			CalcAllTotal()
   			
   		})  
   		
   		heart.forEach(function(e,index){
   			
	   		heart[index].classList.add('heart_active')
   		})
   }
   
    // 수량 up 버튼 클릭시
   function upCnt(cartNum){
	  console.log("click up button : "+cartNum)
	  
	  up(cartNum)
	  CalcRowTotal(cartNum)
	  CalcAllTotal()
	  
   }
   
   // 수량 down 버튼 클릭시
   function downCnt(cartNum){
	   console.log("click down button : "+cartNum)
	   
	   down(cartNum)
	   CalcRowTotal(cartNum)
	   CalcAllTotal()
	   
   }
   
   // Up 버튼 클릭시 실행하는 함수 안 실행 함수
   function up(cartNum){
	  
	  let clickedCnt = document.querySelector(".num_"+cartNum+"_cnt")
	  let clickedCntValue = clickedCnt.value
	  clickedCntValue++
	  clickedCnt.value = clickedCntValue
	  
	  let clickedUBtn = document.querySelector(".num_"+cartNum+"_Ubtn")
	  let clickedDBtn = document.querySelector(".num_"+cartNum+"_Dbtn")
	  
	  if(clickedCntValue >= minOrder){
		  clickedDBtn.removeAttribute('disabled')
          clickedDBtn.classList.remove('disabled_btn')
      }

      if(clickedCntValue >= maxOrder){
    	  clickedUBtn.setAttribute('disabled',true)
          clickedUBtn.classList.add('disabled_btn')
      }
      
      // DB 수정 함수
      cartReCntDB(cartNum, clickedCntValue)
   }
   
   // Down 버튼 클릭시 실행하는 함수 안 실행 함수
   function down(cartNum){
		  
	  let clickedCnt = document.querySelector(".num_"+cartNum+"_cnt")
	  let clickedCntValue = clickedCnt.value
	  clickedCntValue--
	  clickedCnt.value = clickedCntValue
	  
	  let clickedUBtn = document.querySelector(".num_"+cartNum+"_Ubtn")
	  let clickedDBtn = document.querySelector(".num_"+cartNum+"_Dbtn")
	  
	  if(clickedCntValue == minOrder){
		  clickedDBtn.setAttribute('disabled',true)
          clickedDBtn.classList.add('disabled_btn')
      }

      if(clickedCntValue < maxOrder){
    	  clickedUBtn.removeAttribute('disabled')
          clickedUBtn.classList.remove('disabled_btn')
      }
      
      // DB 수정 함수
      cartReCntDB(cartNum, clickedCntValue)
   }
   
   // 수량. 그람수 변화에 따라 합계 계산 함수
   function CalcRowTotal(cartNum){
       
	   let rPrice = parseInt(document.querySelector(".num_"+cartNum+"_Rprice").value)
	   let rCnt = parseInt(document.querySelector(".num_"+cartNum+"_cnt").value)
	   let rGram = parseInt(document.querySelector(".num_"+cartNum+"_gram").textContent)/100
	   
	   let rTotalTag = document.querySelector(".num_"+cartNum+"_Rtotal")
	   let rTotal = parseInt(rTotalTag.textContent.replace(',',''))
	   
	   calc = rPrice * rCnt * rGram
	   rTotalTag.textContent = calc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
   }
   
   // 총 합계 함수
   function CalcAllTotal(){
       this.nums = [];
       this.sum = 0;

       // row total nums 배열에 넣기
       for(let i=0; i<rowTotal.length; i++){
           let num = parseInt(rowTotal[i].textContent.replace(',', ''));
           this.nums.push(num)
       }

       // 배열에 들어간 값 저장
       this.nums.forEach(function(item){
           this.sum += parseInt(item);
       })

       finSum = this.sum

       // 총 상품 금액, 적립 포인트 수정
       let sumText = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       totalPrice.textContent = sumText
       allTotalPrice.textContent = totalPrice.textContent
       totalPriceH.value = this.sum
       
       point(finSum) 
   }
   
   // 포인트 집계 함수
   function point(finSum){
       let point = Math.round(finSum * pointRate)
       let pointText = point.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       allPoint.textContent = pointText
       allPointH.value = point
   }

   // 삭제 클릭시 ---------------------------------------------------------------
   function deleteRow(cartNum){
       
	   let rowArea = document.querySelector(".num_"+cartNum+"_row")
	   let hrdiv = document.querySelector(".num_"+cartNum+"_hrdiv")
	   
	   let rTotalTag = document.querySelector(".num_"+cartNum+"_Rtotal")
	   let rTotal = parseInt(rTotalTag.textContent.replace(',',''))
	  
	   rowArea.classList.add('display_none')
	   hrdiv.classList.add('display_none')
       
       let reTotalPrice = finSum - rTotal
      
       finSum = reTotalPrice
       
       totalPriceH.value = reTotalPrice
       totalPrice.textContent = reTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
       allTotalPrice.textContent = totalPrice.textContent

       point(finSum) 
       deleteRowDB(cartNum)
   }
   
   // ajax ----------------------------------------------------------
  	$.ajaxSetup({	
   			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post"
	})
  
   // 하트 버튼 클릭시 찜 수정 또는 등록 ajax 
   function heartRowDB(memNum, beansNum, cartNum){
   		
   		let clikedHeart = document.querySelector(".num_"+cartNum+"_heart")
   		clikedHeart.classList.toggle('heart_active')
   		
   		$.ajax({
   			url : "/coffee/heart.do",
   			data : {memNum : memNum , beansNum : beansNum},
   			datatype : "text",
   			success : function(data){
   				console.log("찜 성공");
   			},
   			error : function(){
   				console.log('찜 실패!');
   			}
   		})
   }
   
   // 삭제 버튼 클릭시 장바구니 삭제 ajax
   function deleteRowDB(cartNum){
   		console.log("cartNum : " + cartNum)
   	
   		$.ajax({
   			url : "/coffee/deleteCartRow.do",
   			data : { cartNum : cartNum },
   			datatype : "text",
   			success : function(data){
   				console.log("장바구니 행(row) 삭제 성공");
   			},
   			error : function(){
   				console.log("장바구니 행(row) 삭제 실패");
   			}
   		})
   }
   
   // 수량 버튼 클릭시 장바구니 수량 수정하는 ajax
   function cartReCntDB(cartNum, reCntValue){
   	
   		console.log("cartNum : " + cartNum)
   		console.log("reCntValue : " + reCntValue)
   		
   		$.ajax({
   			url : "/coffee/updateCartCnt.do",
   			data : { cartNum : cartNum, cartCnt : reCntValue},
   			datatype : "text",
   			success : function(data){
   				console.log("수량 수정 성공");
   			},
   			error : function(){
   				console.log('수량 수정 실패!');
   			}
   		})
   }
   
 
   
   
   // -------------- 주문서 작성시 사용 
   /*
   let totalPrice = document.querySelector(".total_price")         // 상품가격
   let inputUsePoint = document.querySelector(".input_use_point")  // 입력한 사용포인트
   let totalUsePoint = document.querySelector(".total_use_point")  // 사용포인트
   let canUsePoint = document.querySelector(".can_use_point")      // 사용 가능한 포인트
  
   let allTotalPrice = document.querySelector(".all_total_price")  // 상품가격 + 배송비 - 적립포인트
   let allPoint = document.querySelector(".all_point")             // 적립포인트
   */
   
   // 적립 포인트 사용
  /*  inputUsePoint.addEventListener('keyup',function(){
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
   
   */
		
