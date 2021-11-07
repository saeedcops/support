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