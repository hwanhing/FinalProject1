/**
 * 1. 기간 설정 
    ㄴ default 시작일과 종료일은 당일 이후 선택 불가능
    ㄴ 시작일을 종료일 보다 후로 설정 못하게 지정 
    ㄴ 종료일을 시작일보다 전으로 설정 못하게 지정 
    
   2. 기간 선택 후 조회 버튼 누를 경우 해당하는 데이터 가져오기
   3. 구매완료 버튼 클릭시 배달 완료 처리
 */

	console.log('order list js')

	 // 기간(일자) 변수
	 let startDate = document.querySelector('.start_date')
	 let endDate = document.querySelector('.end_date')
	 
	 // default start_date / end_date 오늘날짜로 세팅
	 //startDate.value = new Date().toISOString().substring(0, 10);
	 //endDate.value = new Date().toISOString().substring(0, 10);
	 
	 // default 시작일과 종료일은 당일 이후 선택 불가능 
	 endDate.setAttribute("max", new Date().toISOString().substring(0, 10))
	 startDate.setAttribute("max", endDate.value)
	 //endDate.setAttribute("max", startDate.value)
	 
	 // 시작일을 종료일 보다 후로 설정 못하게 지정 
	 startDate.addEventListener('click',function(){
	    console.log('startdate 가 클릭 되었습니다.')
	    endDate.setAttribute("min", startDate.value)
	 })
	
	 // 종료일을 시작일보다 전으로 설정 못하게 지정 
	 endDate.addEventListener('click',function(){
	    console.log('endDate 가 클릭 되었습니다.')
	    startDate.setAttribute("max", endDate.value)
	    endDate.setAttribute("min", startDate.value)
	 })
    
    // 2. 기간 선택 후 조회 버튼 누를 경우 해당하는 데이터 가져오기
    function searchData(){
    	if(startDate.value == null){
    		startDate.value = new Date().toISOString().substring(0, 10)
    	}
    	if(endDate.value == null){
    		endDate.value = new Date().toISOString().substring(0, 10)
    	}
   		let startEnd = [startDate.value, endDate.value]
   		console.log(startEnd[0])
    	location.href=`order_list_selectDate.do?startEnd=${startEnd}`
    }
    
	// 3. 구매완료 버튼 클릭시 배달 완료 처리
	let deliveryOkBtn = document.querySelectorAll('.js_delivery_ok') 
	deliveryOkBtn.forEach(function(e,index){
		
		deliveryOkBtn[index].addEventListener('click',function(){
			let orderNum = deliveryOkBtn[index].value
			console.log('구매완료 버튼 클릭')
			console.log(orderNum)
		})
		
	})
	
	 // ajax ----------------------------------------------------------
	 $.ajaxSetup({	
	 		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
	 		type: "post"
	 })
	
	 // 구매완료 버튼 클릭시(row) 배송완료로 타입 업데이트 ajax 
	 function updateRowTypeNum(orderNum){
	 	$.ajax({
	   			url : "/coffee/delivery_ok.do",
	   			data : {orderNum : orderNum },
	   			datatype : "text",
	   			success : function(result){
	   				console.log(`배송완료로 변경 성공 : ${result}`);
	   			
	   			},
	   			error : function(){
	   				console.log("배송완료로 변경 실패");
	   			}
	   		})
	 	}
	