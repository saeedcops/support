var dir = document.getElementsByTagName("html")[0].getAttribute("dir");
const branchItems = document.querySelectorAll(".blist");
const pagination = document.querySelector(".pagination-container");
const tableOutput = document.querySelector(".table-output");
const appTable = document.querySelector(".app-table");
const tableBody = document.querySelector(".table-body");
const searchText = document.querySelector("#searchText");
const notFound = document.querySelector(".not-found");

var branchLastli = branchItems[0];

var branch = branchLastli.getAttribute("data-filter");


function setRequestTable(data) {

    pagination.style.display = "none";
    appTable.style.display = "none";
    tableOutput.style.display = "block";

    tableBody.innerHTML = "";

    data.forEach(item => {
        var color;
        var valid;
        if (item.valid == false) {
            color = "#b01c0b";
            valid = "not valid";

        } else {
            color = "#0bb069";
            valid = "valid";
        }

        tableBody.innerHTML += '<tr onclick=clicked(this)> <td style="display:none">' + item.id + '</td><td style="background:' + color + '">' +
            valid + '</td><td>' +
            item.usern + '</td><td>' + item.categoryn + '</td><td>' +
            item.date + '</td><td>' +
            item.branchn + '</td></tr>';

    });

}


searchText.addEventListener('keyup', (e) => {

    const search = e.target.value;
    // console.log("Value", search);

    if (search.trim().length > 0) {
        pagination.style.display = "none";
        tableBody.innerHTML = "";

        fetch("/admins/requests-json/", {
                body: JSON.stringify({ searchText: search }),
                method: "POST",
            }).then((res) => res.json())
            .then((data) => {

                console.log('Data', data);
                if (data != null) {

                    if (data.length === 0) {

                        // console.log('length', 0);
                        notFound.style.display = "block";
                        tableOutput.style.display = "none";

                    } else {
                        setRequestTable(data);
                        notFound.style.display = "none";


                    }

                }


            });

    } else {

        tableOutput.style.display = "none";
        notFound.style.display = "none";
        pagination.style.display = "block";
        appTable.style.display = "block";
    }

});



function getData() {
    console.log("data");
    fetch("/admins/requests-json/?branch=" + branch, {
            // body:JSON.stringify({ device:device }),
            method: "GET",
        }).then((res) => res.json())
        .then((data) => {
            // console.log('Data', data);
            setRequestTable(data);


        });

}

branchItems.forEach(li =>
    li.onclick = () => {
        branch = li.getAttribute("data-filter");
        // console.log(branch);
        getData();
        li.classList.add('active');
        branchLastli.classList.remove('active');
        branchLastli = li;

    });



function clicked(tr) {

    // console.log("ok!", tr);
    var cell = tr.getElementsByTagName("td")[0];
    var id = cell.innerHTML;


    if (dir === "ltr") {
        window.location.href = "/en/admins/requests/" + id;
    } else {
        window.location.href = "/ar/admins/requests/" + id;
    }
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

                if (dir === "ltr") {
                    window.location.href = "/en/admins/requests/" + id;
                } else {
                    window.location.href = "/ar/admins/requests/" + id;
                }


            };
        };
        currentRow.onclick = createClickHandler(currentRow);
    }
}

addRowHandlers();