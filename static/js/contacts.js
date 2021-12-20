const departmentsItems = document.querySelectorAll(".list");
const tableOutput = document.querySelector(".table-output");
const appTable = document.querySelector(".app-table");
const tableBody = document.querySelector(".table-body");
const searchText = document.querySelector("#searchText");
const paginationContainer = document.querySelector(".pagination-container");
const notFound = document.querySelector(".not-found");
var departmentLastli = departmentsItems[0];
var department = departmentLastli.getAttribute("data-filter");



searchText.addEventListener('keyup', (e) => {

    const search = e.target.value;
    console.log("Value", search);

    if (search.trim().length > 0) {
        paginationContainer.style.display = "none";
        tableBody.innerHTML = "";

        fetch("/contacts/", {
<<<<<<< HEAD
                body: JSON.stringify({searchText: search, department: department }),
=======
                body: JSON.stringify({ searchText: search, department: department }),
>>>>>>> a88a61d5e1db0365cf1023e8cfccd760ddcef486
                method: "POST",
            }).then((res) => res.json())
            .then((data) => {

                console.log('Data', data);
                if (data != null) {

                    if (data.length === 0) {

                        console.log('length', 0);
                        notFound.style.display = "block";
                        tableOutput.style.display = "none";

                    } else {
                        notFound.style.display = "none";
                        appTable.style.display = "none";
                        tableOutput.style.display = "block";
                        tableBody.innerHTML = "";
                        data.forEach(item => {

                            tableBody.innerHTML += '<tr><td><img src="https://osg-support.cops.com/img/' +
                                item.image + '" class="img-rounded" alt="not-found" /></td><td>' +
<<<<<<< HEAD
                                item.first_name + '</td><td>' +
                                item.email + '</td><td>' +
                                item.phone + '</td><td>' +
                                item.department + '</td></tr>';
=======
                                item.name + '</td><td>' +
                                item.email + '</td><td>' +
                                item.phone + '</td><td>' +
                                department + '</td></tr>';
>>>>>>> a88a61d5e1db0365cf1023e8cfccd760ddcef486
                        });
                    }

                }


            });

    } else {

        tableOutput.style.display = "none";
        notFound.style.display = "none";
        paginationContainer.style.display = "block";
        appTable.style.display = "block";
    }

});



function getData() {

    fetch("/contacts/?department=" + department, {
            // body:JSON.stringify({ device:device }),
            method: "GET",
        }).then((res) => res.json())
        .then((data) => {

            if (data != null) {

                console.log('Data', data);
                appTable.style.display = "none";
                tableOutput.style.display = "block";

                tableBody.innerHTML = "";


                data.forEach(item => {

                    tableBody.innerHTML += '<tr><td><img src="https://osg-support.cops.com/img/' +
                        item.image + '" class="img-rounded" alt="not-found" /></td><td>' +
<<<<<<< HEAD
                        item.first_name + '</td><td>' +
                        item.email + '</td><td>' +
                        item.phone + '</td><td>' +
                        item.department + '</td></tr>';
=======
                        item.name + '</td><td>' +
                        item.email + '</td><td>' +
                        item.phone + '</td><td>' +
                        department + '</td></tr>';
>>>>>>> a88a61d5e1db0365cf1023e8cfccd760ddcef486

                });

            }

        });

}


departmentsItems.forEach(li =>
    li.onclick = () => {
        department = li.getAttribute("data-filter");
        console.log(department);
        li.classList.add('active');
        departmentLastli.classList.remove('active');
        departmentLastli = li;
        getData();

    });