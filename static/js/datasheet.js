const item=document.querySelectorAll(".list");
const bitem=document.querySelectorAll(".blist");


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



var blastli=bitem[0];
bitem.forEach(li =>
        li.onclick = () => {
            const barnch=li.getAttribute("data-filter");
            console.log(barnch);
            li.classList.add('active');
            blastli.classList.remove('active');
            blastli=li;
});


var lastli=item[0];
item.forEach(li =>
        li.onclick = () => {
            const device=li.getAttribute("data-filter");
            console.log(device);
            li.classList.add('active');
            lastli.classList.remove('active');
            lastli=li;
 

            // getapi("/datasheet/servers/");

            fetch("/datasheet/servers",{

                }).then((res)=>res)
                .then((data) =>{
                console.log('Data',data);   

              });






});



