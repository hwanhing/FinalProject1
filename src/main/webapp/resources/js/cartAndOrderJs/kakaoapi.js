/**
 * 
 */
 $(function(){
 	
 		$.ajaxSetup({	
   			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type: "post"
		})
		
		let directOrderBean = [];
 		for(let i=0; i<$(".d_con").length; i++){
 			directOrderBean.push($($(".d_con")[i]).val())
	 	}
	 	console.log(directOrderBean)
		
	
 		let requestType = $(".reqtype").val()
 		
 		// 장바구니 번호 배열
 		function rowCartNum(){
 			let rowCartNumArr = [];
 			
 			for(let i=0; i<$(".row_cart_num").length; i++){
	 			rowCartNumArr.push(Number($($(".row_cart_num")[i]).val()))
	 		}
	 		
	 		return rowCartNumArr;
 		}
 		
 		// 장바구니 내역의 상품 단가배열
 		function rowPrice(){
 			
 			let rowPriceArr = [];
	 		for(let i=0; i<$(".row_price").length; i++){
	 			rowPriceArr.push(Number($($(".row_price")[i]).val()))
	 		}
	 		
	 		return rowPriceArr;
 		}
 		
 		// 결제 버튼 클릭
		$("#apibtn").click(function(){
			
			let itemName = $(".itemName").val()
			let quantity = $(".quantity").val()
			let totalAmout = $($(".all_total_price")[0]).text().replace(",","")
			let totalUsePoint = Number($($(".total_use_point")[0]).text().replace(",","")) // 사용한 포인트
			let savePoint = Number($($(".all_point")[0]).text().replace(",",""))
			
			// 카카오 api에 데이터 넘기기--------------------------------
			$.ajax({
				url:'/coffee/kakaopay.do',
				traditional: true,	// ajax 배열 넘기기 옵션
				data : {itemName: itemName, quantity : quantity, totalAmout: totalAmout },
				dataType: 'json',
				success : function(data){
					let box = data.next_redirect_pc_url;
					window.open(box);
				},
				error: function(error){
					alert('에러남');
				}
			})
			
			//-----------------------------------------------------
			// 넘어온 페이지에 따라 session에 넘겨주는 값 상이
			// requestType=="c" : 장바구니에서 넘어온 주문서 작성페이지
			// requestType=="d" : 바로주문으로 넘어온 주문서 작성페이지
			
			if(requestType=="c"){	
				
				let rowCartArr = rowCartNum()	// 장바구니 번호
				let rowPriceArr = rowPrice()	// 주문가격
				
				$.ajax({
					url:'/coffee/order_session.do',
					traditional: true,	// ajax 배열 넘기기 옵션
					data : {requestType: requestType, 
					        rowCartArr: rowCartArr, rowPriceArr: rowPriceArr, 
					        totalUsePoint : totalUsePoint, savePoint : savePoint },
					dataType: 'data',
					success : function(data){
						console.log('order_session.do에 데이터 전송 완료')
					},
					error: function(error){
						console.log('order_session.do에 데이터 전송 실패')
					}
				})
				
			}else{
				
				let directOrderBean = [];
		 		for(let i=0; i<$(".d_con").length; i++){
		 			directOrderBean.push($($(".d_con")[i]).val())
			 	}
				
				$.ajax({
					url:'/coffee/order_session.do',
					traditional: true,	// ajax 배열 넘기기 옵션
					data : {requestType: requestType, directOrderBean: directOrderBean, totalUsePoint : totalUsePoint, savePoint : savePoint },
					dataType: 'data',
					success : function(data){
						console.log('order_session.do에 데이터 전송 완료')
					},
					error: function(error){
						console.log('order_session.do에 데이터 전송 실패')
					}
				})
			}
		})
	})
	