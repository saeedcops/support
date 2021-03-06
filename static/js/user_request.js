var dir = document.getElementsByTagName("html")[0].getAttribute("dir");

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
                    window.location.href = "/en/requests/" + id;
                } else {
                    window.location.href = "/ar/requests/" + id;
                }


            };
        };
        currentRow.onclick = createClickHandler(currentRow);
    }
}


addRowHandlers();