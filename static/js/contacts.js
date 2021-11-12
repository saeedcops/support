const departmentsItems=document.querySelectorAll(".list");
const tableOutput=document.querySelector(".table-output");
const appTable=document.querySelector(".app-table");
const tableBody=document.querySelector(".table-body");
var departmentLastli=departmentsItems[0];
var department=departmentLastli.getAttribute("data-filter");



function getData() {

    fetch("/contacts/?department="+department,{
        // body:JSON.stringify({ device:device }),
        method:"GET",
        }).then((res)=>res.json())
        .then((data) =>{

        if(data != null){
                
            console.log('Data',data);   
            appTable.style.display="none";
            tableOutput.style.display="block";
        
            tableBody.innerHTML = "";
        
        
            data.forEach(item=>{
        
                    tableBody.innerHTML+='<tr><td>'+
                                 item.name+'</td><td>'+
                                 item.email+'</td><td>'+
                                 item.phone+'</td><td>'+
                                 department+'</td></tr>';
        
            });
            
        }

      });
    
}


departmentsItems.forEach(li =>
        li.onclick = () => {
            department=li.getAttribute("data-filter");
            console.log(department);
            li.classList.add('active');
            departmentLastli.classList.remove('active');
            departmentLastli=li;
            getData();

});



