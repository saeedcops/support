const deviceItems=document.querySelectorAll(".list");
const branchItems=document.querySelectorAll(".blist");
const thead=document.querySelectorAll(".thead");

const tableOutput=document.querySelector(".table-output");
const appTable=document.querySelector(".app-table");
const tableBody=document.querySelector(".table-body");
const tableHead=document.querySelector(".table-head");
const pagination=document.querySelector(".pagination-container");
const searchText=document.querySelector("#searchText");
const notFound=document.querySelector(".not-found");
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

function setSwitchTable(data) {

    appTable.style.display = "none";
    tableOutput.style.display = "block";

    tableBody.innerHTML = "";


    thead[0].innerHTML = "Host Name";
    thead[1].innerHTML = "IP";
    thead[2].innerHTML = "Port numbers";
    thead[3].innerHTML = "vlans";
    thead[4].innerHTML = "Trunk ports";
    thead[5].innerHTML = "model";
    thead[6].innerHTML = "Branch";
    thead[7].innerHTML = "";

    data.forEach(item => {

        tableBody.innerHTML += '<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td>' +
            item.host_name + '</td><td>' +
            item.ip + '</td><td>' + item.port_number + '</td><td>' +
            item.vlan + '</td><td>' + item.trunk_ports + '</td><td>' +
            item.model + '</td><td>' + item.name + '</td></tr>';

    });



}


function setFirewallTable(data) {

    appTable.style.display = "none";
    tableOutput.style.display = "block";

    tableBody.innerHTML = "";


    thead[0].innerHTML = "Host Name";
    thead[1].innerHTML = "IP";
    thead[2].innerHTML = "Port numbers";
    thead[3].innerHTML = "Gatewaies";
    thead[4].innerHTML = "Model";
    thead[5].innerHTML = "Branch";
    thead[6].innerHTML = null;
    thead[7].innerHTML = null;

    data.forEach(item => {

        tableBody.innerHTML += '<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td>' +
            item.host_name + '</td><td>' +
            item.ip + '</td><td>' + item.port_numbers + '</td><td>' +
            item.gatewaies + '</td><td>' + item.model + '</td><td>' +
            item.name + '</td></tr>';

    });


}


function setFigerprintTable(data) {

    appTable.style.display = "none";
    tableOutput.style.display = "block";

    tableBody.innerHTML = "";


    thead[0].innerHTML = "IP";
    thead[1].innerHTML = "Port number";
    thead[2].innerHTML = "Vlan";
    thead[3].innerHTML = "Location";
    thead[4].innerHTML = "Model";
    thead[5].innerHTML = "Branch";
    thead[6].innerHTML = null;
    thead[7].innerHTML = null;

    data.forEach(item => {

        tableBody.innerHTML += '<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td>' +
            item.ip + '</td><td>' +
            item.switch_port + '</td><td>' + item.vlan + '</td><td>' +
            item.location + '</td><td>' + item.model + '</td><td>' +
            item.name + '</td></tr>';

    });



}


function setDvrTable(data) {

    appTable.style.display = "none";
    tableOutput.style.display = "block";

    tableBody.innerHTML = "";


    thead[0].innerHTML = "Host Name";
    thead[1].innerHTML = "IP";
    thead[2].innerHTML = "Port number";
    thead[3].innerHTML = "Camera count";
    thead[4].innerHTML = "Model";
    thead[5].innerHTML = "Location";
    thead[6].innerHTML = "Branch";
    thead[7].innerHTML = null;

    data.forEach(item => {

        tableBody.innerHTML += '<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td>' +
            item.host_name + '</td><td>' +
            item.ip + '</td><td>' + item.switch_port + '</td><td>' +
            item.cams + '</td><td>' + item.model + '</td><td>' +
            item.location + '</td><td>' + item.name + '</td></tr>';

    });




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

            tableBody.innerHTML+='<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td>'+
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

            tableBody.innerHTML+='<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td>'+
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

            tableBody.innerHTML+='<tr onclick=clicked(this)> <td style="display:none">'+item.id+'</td><td>'+
                         item.model+'</td><td>'+
                         item.ip+'</td><td>'+
                         item.name+'</td><td>'+
                         item.role+'</td></tr>';

    });
                
   
}




searchText.addEventListener('keyup',(e)=>{

    const search=e.target.value;
    console.log("Value",search);
  
    if(search.trim().length > 0){
        pagination.style.display="none";
        tableBody.innerHTML="";
        
        fetch("/admins/datasheet/devices/",{
        body:JSON.stringify({ searchText:search, device:device}),
        method:"POST",
        }).then((res)=>res.json())
        .then((data) =>{
  
        console.log('Data',data);
        if(data != null){
  
            if(data.length === 0){
  
                console.log('length',0);
                notFound.style.display="block";
                tableOutput.style.display="none";
    
            }else{
  
                notFound.style.display="none";
                appTable.style.display="none";
                tableOutput.style.display="block";
                tableBody.innerHTML = "";
  
                if(device=='PC'){

                    setPCTable(data);
    
                }else if (device=='Servers') {
    
                    setServerTable(data);
    
                    
                } else if (device=='Printers') {
                    setPrinterTable(data);
                    
                }else if (device=='Switches') {
                    
                    setSwitchTable(data);
                } else if (device=='Firewall') {
    
                    setFirewallTable(data);
                }else if (device=='DVR') {
    
                    setDvrTable(data);
                    
                } else if (device=='Fingerprint') {
                    setFigerprintTable(data);
                }
            }
            
        }
  
  
      });
  
    }else{
  
        tableOutput.style.display="none";
        notFound.style.display="none";
        pagination.style.display="block";
        appTable.style.display="block";
    }
  
});
  

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
                
                setSwitchTable(data);
            } else if (device=='Firewall') {

                setFirewallTable(data);
            }else if (device=='DVR') {

                setDvrTable(data);
                
            } else if (device=='Fingerprint') {
                setFigerprintTable(data);
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


function clicked(tr) {

    console.log("ok!",tr);
    var cell = tr.getElementsByTagName("td")[0];
    var id = cell.innerHTML;
    window.location.href="https://osg-support.cops.com/admins/datasheet/"+device+"/"+id;
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
         
          window.location.href="https://osg-support.cops.com/admins/datasheet/PC/"+id;

          
        };
      };
      currentRow.onclick = createClickHandler(currentRow);
    }
  }

  addRowHandlers();

