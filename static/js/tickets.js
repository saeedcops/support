const categoryItems=document.querySelectorAll(".list");
const branchItems=document.querySelectorAll(".blist");
const pagination=document.querySelector(".pagination-container");
const tableOutput=document.querySelector(".table-output");
const appTable=document.querySelector(".app-table");
const tableBody=document.querySelector(".table-body");


var branchLastli=branchItems[0];
var categoryLastli=categoryItems[0];
var branch=branchLastli.getAttribute("data-filter");
var category=categoryLastli.getAttribute("data-filter");



function setTicketTable(data) {

    pagination.style.display="none";
    appTable.style.display="none";
    tableOutput.style.display="block";

    tableBody.innerHTML = "";

    data.forEach(item=>{
            var color;
            if(item.status=="closed"){
              color="#b01c0b";

            }else if(item.status=="pending"){
              color="#FFFB33";

            }else{
              color="#0bb069";

            }

            tableBody.innerHTML+='<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td style="background:'+color+'">'+
                         item.status+'</td><td>'+
                         item.usern+'</td><td>'+item.categoryn+'</td><td>'+
                         item.description+'</td><td>'+item.open_date+'</td><td>'+
                         item.branchn+'</td><td>'+item.adminn+'</td></tr>';

    });

                
   
}


function getData() {

    fetch("/admins/tickets-json/?category="+category+"&branch="+branch,{
        // body:JSON.stringify({ device:device }),
        method:"GET",
        }).then((res)=>res.json())
        .then((data) =>{

        if(data != null){
                
            console.log('Data',data);   
            setTicketTable(data);

        }

      });
    
}

branchItems.forEach(li =>
        li.onclick = () => {
            branch=li.getAttribute("data-filter");
            console.log(branch);
            li.classList.add('active');
            branchLastli.classList.remove('active');
            branchLastli=li;
            getData();
});



categoryItems.forEach(li =>
        li.onclick = () => {
            category=li.getAttribute("data-filter");
            console.log(category);
            li.classList.add('active');
            categoryLastli.classList.remove('active');
            categoryLastli=li;
            getData();

});


function clicked(tr) {

    console.log("ok!",tr);
    var cell = tr.getElementsByTagName("td")[0];
    var id = cell.innerHTML;
    window.location.href="https://osg-support.cops.com/tickets/"+id;
}




function addRowHandlers() {
    var table = document.querySelector(".table");
    var rows = table.getElementsByTagName("tr");
    for (i = 0; i < rows.length; i++) {
      var currentRow = table.rows[i];
      var createClickHandler = function(row) {
        return function() {
          var cell = row.getElementsByTagName("td")[0];
          var id = cell.innerHTML;
         
          window.location.href="https://osg-support.cops.com/tickets/"+id;

          
        };
      };
      currentRow.onclick = createClickHandler(currentRow);
    }
  }

addRowHandlers();