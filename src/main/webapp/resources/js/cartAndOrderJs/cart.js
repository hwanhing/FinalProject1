console.log('js')
   // 버튼 클릭시 ---------------------------------------------------------------
   
   /*
    numToString >> 변수명.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')"
    StringToNum >> parseInt(b_price.textContent.replace(/,/g , '')
    replaceAll(",", "")
   */
   
   // 변수 
   // 구매 최대 수량, 최소 수량 변수
   const maxOrder = 20
   const minOrder = 1
   
   // 구매 최대 그람, 최소 그람
   const maxGram = 400
   const minGram = 100
   
   const pointRate = 0.05
   let finSum = 0;
 
   // 버튼 변수 
   let btnDown = document.querySelectorAll(".btn_down")
   let gbtnDown = document.querySelectorAll(".gram_btn_down")
   
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
		    
	    	if(rowGram[index].value==100){
		           gbtnDown[index].setAttribute('disabled',true)
		           gbtnDown[index].classList.add('disabled_btn')
		    }
   			
   			
   			let rowPriceNum = parseInt(rowPrice[index].value) // 단가
   			let rowInCntNum = parseInt(inputCnt[index].value) // 수량
   			let rowGramNum = parseInt(rowGram[index].value)/100 // 그람수/100

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
   
   // 그람 up 버튼 클릭시
   function gramUpCnt(cartNum){
   		console.log('그람 up클릭')
    	let clickedGram = document.querySelector(".num_"+cartNum+"_gram")
    	let clickedGramValue = parseInt(clickedGram.value) +100 
    	clickedGram.value = clickedGramValue
    	
    	let clickedGUBtn = document.querySelector(".num_g_"+cartNum+"_Ubtn")
	  	let clickedGDBtn = document.querySelector(".num_g_"+cartNum+"_Dbtn")
    	
    	if(clickedGramValue >= minGram){
			clickedGDBtn.removeAttribute('disabled')
	        clickedGDBtn.classList.remove('disabled_btn')
	    }
	
	    if(clickedGramValue >= maxGram){
	    	clickedGUBtn.setAttribute('disabled',true)
	        clickedGUBtn.classList.add('disabled_btn')
	    }
	    
	    CalcRowTotal(cartNum)
	   	CalcAllTotal()
   		
   		// DB 수정 함수
      	cartReGramDB(cartNum, clickedGramValue)
   }
   
   // 그람 down 버튼 클릭시 
   function gramDownCnt(cartNum){
   		console.log('그람 down클릭')
   		let clickedGram = document.querySelector(".num_"+cartNum+"_gram")
    	let clickedGramValue = parseInt(clickedGram.value) -100 
    	clickedGram.value = clickedGramValue
    	
    	let clickedGUBtn = document.querySelector(".num_g_"+cartNum+"_Ubtn")
	  	let clickedGDBtn = document.querySelector(".num_g_"+cartNum+"_Dbtn")
	  	
	  	if(clickedGramValue == minGram){
			 clickedGDBtn.setAttribute('disabled',true)
	         clickedGDBtn.classList.add('disabled_btn')
	    }
	
	    if(clickedGramValue < maxGram){
	    	 clickedGUBtn.removeAttribute('disabled')
	         clickedGUBtn.classList.remove('disabled_btn')
	    }
	    
	    CalcRowTotal(cartNum)
	   	CalcAllTotal()
	   	
	   	// DB 수정 함수
      	cartReGramDB(cartNum, clickedGramValue)
   }
   
   // 수량. 그람수 변화에 따라 합계 계산 함수
   function CalcRowTotal(cartNum){
       
	   let rPrice = parseInt(document.querySelector(".num_"+cartNum+"_Rprice").value)
	   let rCnt = parseInt(document.querySelector(".num_"+cartNum+"_cnt").value)
	   let rGram = parseInt(document.querySelector(".num_"+cartNum+"_gram").value)/100
	   
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
   
   // 장바구니 목록이 없다면 결제하기 버튼 없애기
   
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
   
   // 그람 버튼 클릭시 장바구니 그람 수정하는 ajax
   function cartReGramDB(cartNum, reGramValue){
   	
   		console.log("cartNum : " + cartNum)
   		console.log("reGramValue : " + reGramValue)
   		
   		$.ajax({
   			url : "/coffee/updateCartGram.do",
   			data : { cartNum : cartNum, cartGram : reGramValue},
   			datatype : "text",
   			success : function(data){
   				console.log("그람 수정 성공");
   			},
   			error : function(){
   				console.log('그람 수정 실패!');
   			}
   		})
   }
 
 
   // 결제 하기 버튼 클릭시 정보 모두 넘겨주기
   function cartToOrder(){
   		console.log('결제하기 버튼을 클릭했습니다.')
   
   		// 장바구니 목록 가져오기 
   		let rowArea = document.querySelectorAll('.row_area')
   		
   		let allArray = []
   		let rowArray = []
   		
   		// 이미지, 상품명, 그람, 수량, 갈기, 금액
   		// inputCnt(수량), rowGram(그람), rowTotal(행 합)
		 let rowImges = document.querySelectorAll('.cart_img_file')
		 let rowPName = document.querySelectorAll('.cart_p_name')
		 let rowGrind = document.querySelectorAll('.cart_p_grind')
   	
   		console.log(rowArea.length)
   	
   		for(let i =0; i<rowArea.length; i++){
			rowArray.push(rowImges[i].src)
   			rowArray.push(rowPName[i].textContent)
   			rowArray.push(parseInt(rowGram[i].value))
   			rowArray.push(parseInt(inputCnt[i].value))
   			rowArray.push(parseInt(rowGrind[i].value))
   			rowArray.push(parseInt(rowTotal[i].textContent.replace(',','')))
   		}
   		
   		for(let i=0; i<=rowArray.length; i++){
   			allArray.push(rowArray.splice(0,6))
   		}
   		
   		console.log(rowArray)
   		console.log(allArray)
   		
   		$.ajax({
   			url : "/coffee/bean_order.do",
   			data : { allArray : allArray},
   			datatype : "text",
   			success : function(data){
   				console.log("전송 성공");
   			},
   			error : function(){
   				console.log('전송 실패!');
   			}
   		})
   	
   		
   }
   
   
  
		
