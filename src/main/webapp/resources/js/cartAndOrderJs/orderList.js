	console.log('order list js')

	 // 기간(일자) 변수
	 let startDate = document.querySelector('.start_date')
	 let endDate = document.querySelector('.end_date')
	 
	 // default start_date / end_date 오늘날짜로 세팅
	 //startDate.value = new Date().toISOString().substring(0, 10);
	 //endDate.value = new Date().toISOString().substring(0, 10);
	 
	 // default 시작일과 종료일은 당일 이후 선택 불가능 
	 startDate.setAttribute("max", endDate.value)
	 endDate.setAttribute("max", new Date().toISOString().substring(0, 10))
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
    
    // 일자 선택 후 조회 버튼 클릭
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
    
	
	
	