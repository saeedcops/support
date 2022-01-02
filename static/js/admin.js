var admin = document.getElementById('admin').getContext('2d');
var category = document.getElementById('category').getContext('2d');
var branch = document.getElementById('branch').getContext('2d');


const renderChar = (label, data, ctx, text) => {

    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: label,

            datasets: [{
                label: '# of Votes',
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1,
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            legend: {
                position: 'bottom',
                display: true,
                align: 'start',
            },
            title: {
                display: true,
                text: text,
                position: 'top',
            }

        }
    });

}

const getChartData = () => {

    fetch("/admins/admin-summary/", {
            method: "GET",
        }).then((res) => res.json())
        .then((result) => {
            // console.log('Data', result);

            const [label, data] = [Object.keys(result['admin']), Object.values(result['admin']), ];
            const [clabel, cdata] = [Object.keys(result['category']), Object.values(result['category']), ];
            const [blabel, bdata] = [Object.keys(result['branch']), Object.values(result['branch']), ];


            renderChar(label, data, admin, "Admins Summary");
            renderChar(clabel, cdata, category, "Category Summary");
            renderChar(blabel, bdata, branch, "Branch Summary");

        });



}

document.onload = getChartData();