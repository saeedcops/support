const deviceItems=document.querySelectorAll(".list");
const branchItems=document.querySelectorAll(".blist");
const thead=document.querySelectorAll(".thead");

const tableOutput=document.querySelector(".table-output");
const appTable=document.querySelector(".app-table");
const tableBody=document.querySelector(".table-body");
const tableHead=document.querySelector(".table-head");


var branchLastli=branchItems[0];
var deviceLastli=deviceItems[0];
var branch=branchLastli.getAttribute("data-filter");
var device=deviceLastli.getAttribute("data-filter");

// 
async function getapi(url) {
    
    // Storing response
    const response = await fetch(url);
    
    // Storing data in form of JSON
    var data = await response.json();
    console.log(data);
    if (response) {
        // hideloader();
    }
    // show(data);
}



function setPCTable(data) {

    appTable.style.display="none";
    tableOutput.style.display="block";

    tableBody.innerHTML = "";
   
    
    thead[0].innerHTML="Host Name";
    thead[1].innerHTML="OS";
    thead[2].innerHTML="IP";
    thead[3].innerHTML="Ram";
    thead[4].innerHTML="Vlan";
    thead[5].innerHTML="CPU";
    thead[6].innerHTML="Branch";
    thead[7].innerHTML="User";

    data.forEach(item=>{

            tableBody.innerHTML+='<tr><td>'+
                         item.host_name+'</td><td>'+
                         item.os+'</td><td>'+item.ip+'</td><td>'+
                         item.ram+'</td><td>'+item.vlan+'</td><td>'+
                         item.cpu+'</td><td>'+item.name+'</td><td>'+item.username+'</td></tr>';

    });

                
   
}


function setServerTable(data) {

    appTable.style.display="none";
    tableOutput.style.display="block";

    tableBody.innerHTML = "";
   
    
    thead[0].innerHTML="Host Name";
    thead[1].innerHTML="OS";
    thead[2].innerHTML="IP";
    thead[3].innerHTML="Ram";
    thead[4].innerHTML="Vlan";
    thead[5].innerHTML="CPU";
    thead[6].innerHTML="Branch";
    thead[7].innerHTML="Role";

    data.forEach(item=>{

            tableBody.innerHTML+='<tr><td>'+
                         item.host_name+'</td><td>'+
                         item.os+'</td><td>'+item.ip+'</td><td>'+
                         item.ram+'</td><td>'+item.vlan+'</td><td>'+
                         item.cpu+'</td><td>'+item.name+'</td><td>'+item.role+'</td></tr>';

    });

                
   
}



function setPrinterTable(data) {

    appTable.style.display="none";
    tableOutput.style.display="block";

    tableBody.innerHTML = "";
   
    
    thead[0].innerHTML="Model";
    thead[1].innerHTML="IP";
    thead[2].innerHTML="Branch";
    thead[3].innerHTML="Role";
    thead[4].innerHTML=null;
    thead[5].innerHTML=null;
    thead[6].innerHTML=null;
    thead[7].innerHTML=null;

    data.forEach(item=>{

            tableBody.innerHTML+='<tr><td>'+
                         item.model+'</td><td>'+
                         item.ip+'</td><td>'+
                         item.name+'</td><td>'+
                         item.role+'</td></tr>';

    });
                
   
}

function getData() {

    fetch("/admins/datasheet/devices/?device="+device+"&branch="+branch,{
        // body:JSON.stringify({ device:device }),
        method:"GET",
        }).then((res)=>res.json())
        .then((data) =>{

        if(data != null){
                
            console.log('Data',data);   
            if(device=='PC'){

                setPCTable(data);

            }else if (device=='Servers') {

                setServerTable(data);

                
            } else if (device=='Printers') {
                setPrinterTable(data);
                
            }else if (device=='Switches') {
                
                setPCTable(data);
            } else if (device=='Firewall') {

                setPCTable(data);
            }else if (device=='DVR') {

                setPCTable(data);
                
            } else if (device=='Fingerprint') {
                setPCTable(data);
            }

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



deviceItems.forEach(li =>
        li.onclick = () => {
            device=li.getAttribute("data-filter");
            console.log(device);
            li.classList.add('active');
            deviceLastli.classList.remove('active');
            deviceLastli=li;
            getData();

});



