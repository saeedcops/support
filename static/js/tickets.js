var dir = document.getElementsByTagName("html")[0].getAttribute("dir");
const branchItems = document.querySelectorAll(".blist");
const pagination = document.querySelector(".pagination-container");
const tableOutput = document.querySelector(".table-output");
const appTable = document.querySelector(".app-table");
const tableBody = document.querySelector(".table-body");
const searchText = document.querySelector("#searchText");
const notFound = document.querySelector(".not-found");
var branchLastli = branchItems[0];
// var categoryLastli=categoryItems[0];
var branch = branchLastli.getAttribute("data-filter");
// var category=categoryLastli.getAttribute("data-filter");



searchText.addEventListener('keyup', (e) => {

    const search = e.target.value;
    // console.log("Value", search);

    if (search.trim().length > 0) {
        pagination.style.display = "none";
        tableBody.innerHTML = "";

        fetch("/tickets/search/", {
                body: JSON.stringify({ searchText: search }),
                method: "POST",
            }).then((res) => res.json())
            .then((data) => {

                // console.log('Data', data);
                if (data != null) {

                    if (data.length === 0) {

                        // console.log('length', 0);
                        notFound.style.display = "block";
                        tableOutput.style.display = "none";

                    } else {

                        notFound.style.display = "none";
                        appTable.style.display = "none";
                        tableOutput.style.display = "block";
                        tableBody.innerHTML = "";

                        data.forEach(item => {
                            var color;
                            if (item.status == "closed") {
                                color = "#b01c0b";

                            } else if (item.status == "pending") {
                                color = "#FFFB33";

                            } else {
                                color = "#0bb069";

                            }

                            tableBody.innerHTML += '<tr onclick=clicked(this)> <td style="display:none">' + item.id + '</td><td style="background:' + color + '">' +
                                item.status + '</td><td>' +
                                item.usern + '</td><td>' + item.categoryn + '</td><td>' +
                                item.description + '</td><td>' + item.open_date + '</td><td>' +
                                item.branchn + '</td><td>' + item.adminn + '</td></tr>';

                        });
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




function setTicketTable(data) {

    pagination.style.display = "none";
    appTable.style.display = "none";
    tableOutput.style.display = "block";

    tableBody.innerHTML = "";

    data.forEach(item => {
        var color;
        if (item.status == "closed") {
            color = "#b01c0b";

        } else if (item.status == "pending") {
            color = "#FFFB33";

        } else {
            color = "#0bb069";

        }

        tableBody.innerHTML += '<tr onclick=clicked(this)> <td style="display:none">' + item.id + '</td><td style="background:' + color + '">' +
            item.status + '</td><td>' +
            item.usern + '</td><td>' + item.categoryn + '</td><td>' +
            item.description + '</td><td>' + item.open_date + '</td><td>' +
            item.branchn + '</td><td>' + item.adminn + '</td></tr>';

    });



}


function getData() {

    fetch("/tickets/search/?branch=" + branch, {
            // body:JSON.stringify({ device:device }),
            method: "GET",
        }).then((res) => res.json())
        .then((data) => {

            if (data != null) {

                // console.log('Data', data);
                setTicketTable(data);

            }

        });

}

branchItems.forEach(li =>
    li.onclick = () => {
        branch = li.getAttribute("data-filter");
        // console.log(branch);
        li.classList.add('active');
        branchLastli.classList.remove('active');
        branchLastli = li;
        getData();
    });




function clicked(tr) {

    console.log("ok!", tr);
    var cell = tr.getElementsByTagName("td")[0];
    var id = cell.innerHTML;


    if (dir === "ltr") {
        window.location.href = "/en/tickets/" + id;
    } else {
        window.location.href = "/ar/tickets/" + id;
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
                    window.location.href = "/en/tickets/" + id;
                } else {
                    window.location.href = "/ar/tickets/" + id;
                }


            };
        };
        currentRow.onclick = createClickHandler(currentRow);
    }
}

addRowHandlers();