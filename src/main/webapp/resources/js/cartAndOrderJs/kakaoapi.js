/**
 * 
 */
 $(function(){
 
 		let requestType = $(".reqtype").val()
 		// 장바구니 내역의 상품 단가배열
 		function rowPrice(){
 			
 			let rowPriceArr = [];
	 		for(let i=0; i<$(".row_price").length; i++){
	 			rowPriceArr.push($($(".row_price")[i]).val())
	 		}
	 		
	 		console.log(rowPriceArr)
	 		return rowPriceArr;
 		}
 		
		$("#apibtn").click(function(){
			
			let itemName = $(".itemName").val()
			let quantity = $(".quantity").val()
			let totalAmout = $($(".all_total_price")[0]).text().replace(",","")
			let totalUsePoint = $($(".total_use_point")[0]).text().replace(",","") // 사용한 포인트
			
			// 카카오 api에 데이터 넘기기
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
			
			if(requestType=="c"){	// 장바구니에서 넘어온 주문서작성 페이지
				
				let rowPriceArr = rowPrice()
				$.ajax({
					url:'/coffee/order_session.do',
					traditional: true,	// ajax 배열 넘기기 옵션
					data : {requestType: requestType, rowPriceArr: rowPriceArr, totalUsePoint : totalUsePoint },
					dataType: 'data',
					success : function(data){
						console.log('order_session.do에 데이터 전송 완료')
					},
					error: function(error){
						console.log('order_session.do에 데이터 전송 실패')
					}
				})
				
			}else{	// 바로주문에서 넘어온 주문서작성 페이지
				
				$.ajax({
					url:'/coffee/order_session.do',
					traditional: true,	// ajax 배열 넘기기 옵션
					data : {rowPriceArr: rowPriceArr, totalUsePoint : totalUsePoint },
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
	